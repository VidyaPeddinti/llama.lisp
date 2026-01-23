  ;; CMD: guile ../../prelisp.scm < {filename}
(prelisp
    (guile
        
        (define NUM_THREADS 256)
        (define NUM_WARPS (/ NUM_THREADS 32))

        (define shared_data_reduce_sum_v1 (lambda (shared_data)
            `(  (declare threadidx int)
                (set threadidx [tid.x])
                (declare stride int)
                    (for ((set stride (div ,NUM_THREADS 2)) (gt stride 0) (set stride (div stride 2)))
                        (if (lt threadidx stride)
                            (store (aptradd ,shared_data threadidx) 
                                (fadd 
                                    (load (ptradd ,shared_data threadidx))
                                    (load (ptradd ,shared_data (add threadidx stride))))))
                        (__syncthreads))
                        )
                ))


        (define block_reduce_sum_v1 (lambda (input_data shared_data num_elem)
              `((declare num_elem__per_thread int)
                (set num_elem__per_thread (div (sub (add ,num_elem ,NUM_THREADS) 1) ,NUM_THREADS))
                (declare threadidx int)
                (set threadidx [tid.x])
                (declare sum float)
                (declare offset int)
                (declare i int)
                (for ((set i 0) (lt i num_elem__per_thread) (set i (add i 1)))
                        (set offset (mul (add threadidx i) ,NUM_THREADS))
                            (if (lt offset ,num_elem)
                                (set sum (fadd sum (load (ptradd ,input_data offset))))))
                                  
                (store (aptradd ,shared_data threadidx) sum)
                (__syncthreads)
                ;;(declare block_sum float)
                (shared_data_reduce_sum_v1 ,shared_data)
                        )))
        )


    (cuda-lisp
        
        (define-inline-brilisp ((memcpy4 void) (dst (ptr int8)) (src (ptr int8)))
        (set (temp (struct int4))
            (asm "ld.global.v4.b32 {$0, $1, $2, $3}, [$4]; st.global.v4.b32 [$5], {$0, $1, $2, $3};"
                "=&r,=&r,=&r,=&r,l,l" src dst))
        (ret))

        (define ((llvm.nvvm.read.ptx.sreg.tid.x  int)))
        (define ((llvm.nvvm.barrier0 void)))
        (define-shared shared_data1 [,NUM_THREADS])
        
        (define-kernel ((kernel1 void) 
                        (output_data (ptr float))
                        (input_data (ptr float)) 
                        (num_ele_per_batch int))

              (if (eq (rem ,NUM_THREADS 32) 0)
                  (
                        (declare block_idx int)
                        (set block_idx [bid.x])
                        (declare block_sum float)
                        (set input_data (ptradd input_data (mul block_idx num_ele_per_batch)) )
                        ,@(block_reduce_sum_v1 'input_data 'shared_data1  'num_ele_per_batch)
                        (set block_sum (load (aptradd shared_data1 0)))
                        (if (eq threadidx 0)
                            (store (ptradd output_data block_idx) block_sum)
                        )))
                (ret))))
