(c-lisp
     (define ((llvm.nvvm.read.ptx.sreg.tid.x int)))
     (define ((llvm.nvvm.read.ptx.sreg.ctaid.x int)))
     (define ((llvm.nvvm.barrier0 void)))
     (define-global (shared_data (arr 256 float)) (addrspace 3))
     
     
     (define ((kernel void)
               (output_data (ptr float))
               (input_data (ptr float))
                    (num_ele_per_batch int))

          
               (declare block_idx int)
               (set block_idx
                    (call llvm.nvvm.read.ptx.sreg.ctaid.x))
               (declare block_sum float)
               (set input_data
                    (ptradd
                    input_data
                    (mul block_idx num_ele_per_batch)))
               (declare num_elem__per_thread int)
               (set num_elem__per_thread
                    (div (sub (add num_ele_per_batch 256) 1) 256))
               (declare threadidx int)
               (set threadidx
                    (call llvm.nvvm.read.ptx.sreg.tid.x))
               (declare sum float)
               (declare offset int)
               (declare i int)
               (for ((set i 0)
                    (lt i num_elem__per_thread)
                    (set i (add i 1)))
                    (set offset (mul (add threadidx i) 256))
                    (if (lt offset num_ele_per_batch)
                    (set sum
                         (fadd sum (load (ptradd input_data offset))))))
               (store (aptradd shared_data threadidx) sum)
               (call llvm.nvvm.barrier0)
               ((declare threadidx int)
               (set threadidx
                    (call llvm.nvvm.read.ptx.sreg.tid.x))
               (declare stride int)
               (for ((set stride (div 256 2))
                    (gt stride 0)
                    (set stride (div stride 2)))
                    (if (lt threadidx stride)
                         (store (aptradd shared_data threadidx)
                              (fadd (load (aptradd shared_data threadidx))
                                   (load (aptradd
                                             shared_data
                                             (add threadidx stride))))))
                    (call llvm.nvvm.barrier0)))
               (set block_sum (load (aptradd shared_data 0)))
               (if (eq threadidx 0)
               (store (ptradd output_data block_idx) block_sum))
          (ret)))
