program main
     use, intrinsic :: iso_c_binding 
     include 'fftw3.f03'
     type(C_PTR) :: plan
     complex(C_DOUBLE_COMPLEX), dimension(1024,1000) :: in, out
     plan = fftw_plan_dft_2d(1000, 1024, in, out, FFTW_FORWARD,FFTW_ESTIMATE)
     call fftw_execute_dft(plan, in, out)
   
     call fftw_destroy_plan(plan)

     write(*,*) "working"

 
 end program main