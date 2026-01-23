  ;; CMD: guile ../../prelisp.scm < {filename}
(prelisp
    (guile
        (define BM 128)
        
        (define NUM_THREADS 256)
        (define WNITER 2)
        (define NUM_WARPS (/ NUM_THREADS 32))

        (define shared_data_reduce_sum_v1 (lambda (shared_data)
            `((if (eq (div ,NUM_THREADS 32) 0)
                  ((declare threadidx int)
                    (set threadidx (call [tid.x]))
                    (declare stride int)
                    (for ((set stride (div NUM_THREADS 2)) (gt stride 0) (set stride (div stride 2)))
                           (if (lt threadidx stride)
                               (store (aptradd ,shared_data threadidx) 
                                    (add 
                                        (load (ptradd ,shared_data threadidx))
                                        (load (ptradd ,shared_data (add threadidx stride))))))
                            (__syncthreads))
                        (ret (load (aptradd ,shared_data 0)) ))))
                ))

        ;;think about return here

        (define shared_data_reduce_sum_v2 (lambda (shared_data)
              `((declare sum float)
                (declare i int)
                (for ((set i 0) (lt i (div NUM_THREADS 2)) (set i (add i 1)))
                        (set sum (add sum (load (aptradd ,shared_data i))))))
                (ret sum)))

        (define warp_reduce_sum (lambda (val)
              `((declare FULL_MASK int)
                (set FULL_MASK 0xffffffff)
                (declare offset int)
                (for ((set offset 16) (gt offset 0) (set offset (add offset (div offset 2))))
                        (set ,val (add ,val (call (__shfl_down_sync FULL_MASK ,val offset))))))
                (ret sum)))

        
        (define block_reduce_sum_v1 (lambda (input_data shared_data num_elem)
              `( (if (eq (rem NUM_THREADS 32)  0)
                        ((declare num_elem__per_thread int)
                        (set num_elem__per_thread (div (sub (add num_elem NUM_THREADS) 1) NUM_THREADS))
                        (declare threadidx int)
                        (set threadidx (call [tid.x]))
                        (declare sum float)
                        (declare i int)
                        (for ((set i 0) (lt i num_elem__per_thread) (set i (add i 1)))
                                (set offset (mul (add threadidx i) NUM_THREADS))
                                (if (lt offset num_elem)
                                        (set sum (add sum (ptradd input_data offset)))))
                                  
                        (set (ptradd shared_data threadix) sum)
                        (__syncthreads)
                        (declare block_sum float)
                        (set block_sum (shared_data_reduce_sum_v1 shared_data))
                        (ret block_sum)
                        )))))


        (define block_reduce_sum_v2 (lambda (input_data shared_data num_elem)
              `(((declare num_elem__per_thread int)
                (set num_elem__per_thread (div (sub (add num_elem NUM_THREADS) 1) NUM_THREADS))
                (declare threadidx int)
                (set threadidx (call [tid.x]))
                (declare sum float)
                (declare i int)
                (for ((set i 0) (lt i num_elem__per_thread) (set i (add i 1)))
                        (set offset (mul (add threadidx i) NUM_THREADS))
                        (if (lt offset num_elem)
                            (set sum (add sum (ptradd input_data offset)))))
                                  
                (set sum (call warp_reduce_sum sum))
                (if (eq (rem [tid.x] 32) 0)
                    (store (ptradd ,shared_data (div [tid.x] 32)) sum)
                )
                (__syncthreads)
                (declare block_sum float)
                (set block_sum (call shared_data_reduce_sum_v2 ,shared_data))
                (ret block_sum)))))

        (define ceil-div (lambda (M N)
            `(div (add ,M (sub ,N 1)) ,N))))


    (cuda-lisp
        
        (define-inline-brilisp ((memcpy4 void) (dst (ptr int8)) (src (ptr int8)))
        (set (temp (struct int4))
            (asm "ld.global.v4.b32 {$0, $1, $2, $3}, [$4]; st.global.v4.b32 [$5], {$0, $1, $2, $3};"
                "=&r,=&r,=&r,=&r,l,l" src dst))
        (ret))

        (define ((llvm.nvvm.read.ptx.sreg.tid.x  int)))
        (define ((llvm.nvvm.barrier0 void)))
        (define-shared shared_data1 [NUM_THREADS])
        (define-shared shared_data2 [NUM_WARPS])

        (define-kernel ((kernel1 void) 
                        (output_data (ptr float))
                        (input_data (ptr float)) 
                        (num_ele_per_batch int))

              (if (eq (rem NUM_THREADS 32) 0)
                  (
                        (declare block_idx int)
                        (set block_idx [bid.x])
                        (declare block_sum float)
                        (set block_sum ,@(block_reduce_sum_v1 (add input_data (mul block_idx num_ele_per_batch)) shared_data1  num_ele_per_batch))
                        (if (eq threadidx 0)
                            (store (ptradd output_data block_idx) block_sum)
                        )))
                (ret))


        (define-kernel ((kernel2 void) 
                        (output_data (ptr float))
                        (input_data (ptr float)) 
                        (num_ele_per_batch int))

              (if (eq (rem NUM_THREADS 32) 0)
                  ((delcare NUM_WARPS int)
                   (set NUM_WARPS (div NUM_THREADS 32))
                   (declare block_idx int)
                   (set block_idx [bid.x])
                   (declare threadidx int)
                   (set threadidx (call [tid.x]))
                   (declare block_sum float)
                   (set block_sum ,@(block_reduce_sum_v2 (add input_data (mul block_idx num_ele_per_batch)) shared_data2  num_ele_per_batch))
                   (if (eq threadidx 0)
                        (store (ptradd output_data block_idx) block_sum))))
                (ret))))
