program main
    use, intrinsic :: iso_c_binding 
    include 'fftw3.f03'

    real(16), parameter :: pi = 4 * atan(1.0_16)

    integer, parameter :: n = 1024

    real(c_double), allocatable :: regular_data_in(:)
    complex(c_double_complex), allocatable :: regular_data_out(:)

    type(c_ptr) :: plan_forward

    real(16) :: t = 0.0
    real(16) :: dt = 1 / real(n - 1)

    integer :: i

    allocate(regular_data_in(n))

    allocate(regular_data_out(n / 2 + 1))


    do i = 1, n        
        regular_data_in(i) = sin(2 * pi * t * 200) + 2 * sin(2 * pi * t * 400)
        t = t + dt
    end do

    plan_forward = fftw_plan_dft_r2c_1d(size(regular_data_in), regular_data_in, regular_data_out, FFTW_ESTIMATE + FFTW_UNALIGNED)

    call fftw_execute_dft_r2c(plan_forward, regular_data_in, regular_data_out)


    open(19, file='../res/signals_sum', status='unknown')

    do i = 1, size(regular_data_out)
        write(19, '(I15, F15.10)') i, abs(regular_data_out(i))
    end do

    close(19)
    

    call fftw_destroy_plan(plan_forward)

    deallocate(regular_data_in)
    deallocate(regular_data_out)
 end program main