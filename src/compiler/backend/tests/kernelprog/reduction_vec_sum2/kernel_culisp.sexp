(cuda-lisp
  (define-inline-brilisp
    ((memcpy4 void)
     (dst (ptr int8))
     (src (ptr int8)))
    (set (temp (struct int4))
         (asm "ld.global.v4.b32 {$0, $1, $2, $3}, [$4]; st.global.v4.b32 [$5], {$0, $1, $2, $3};"
              "=&r,=&r,=&r,=&r,l,l"
              src
              dst))
    (ret))
  (define ((llvm.nvvm.read.ptx.sreg.tid.x int)))
  (define ((llvm.nvvm.barrier0 void)))
  (define-shared shared_data (8))
  (define-kernel
    ((kernel void)
     (output_data (ptr float))
     (input_data (ptr float))
     (num_ele_per_batch int))
    (if (eq (rem 256 32) 0)
      ((declare block_idx int)
       (set block_idx (bid.x))
       (declare block_sum float)
       (set input_data
            (ptradd
              input_data
              (mul block_idx num_ele_per_batch)))
       (declare num_elem_per_thread int)
       (set num_elem_per_thread
            (div (sub (add num_ele_per_batch 256) 1) 256))
       (declare threadidx int)
       (set threadidx (tid.x))
       (declare sum float)
       (declare offset int)
       (declare i int)
       (for ((set i 0)
             (lt i num_elem_per_thread)
             (set i (add i 1)))
            (set offset (add thread_idx (mul i 256)))
            (if (lt offset num_ele_per_batch)
              (set sum
                   (fadd sum (load (ptradd input_data offset))))))
       ((declare FULL_MASK int)
        (set FULL_MASK #{0xffffffff}#)
        (for ((set offset 16)
              (gt offset 0)
              (set offset (div offset 1)))
             (set sum (__shfl_down_sync FULL_MASK sum offset))))
       (if (rem tid.x 32 0)
         (store (aptradd shared_data (div tid.x 32)) sum))
       (__syncthreads)
       ((for ((set i 0) (lt i 8) (set i (add i 1)))
             (set sum
                  (fadd sum (load (aptradd ,shared_data i))))))
       (set block_sum (load (aptradd shared_data 0)))
       (if (eq threadidx 0)
         (store (ptradd output_data block_idx) block_sum))))
    (ret)))
