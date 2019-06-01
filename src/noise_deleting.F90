program main
    use, intrinsic :: iso_c_binding 
    include 'fftw3.f03'

    real(16), parameter :: pi = 4 * atan(1.0_16)

    integer, parameter :: n = 1024

    real(c_double), allocatable :: garbled_data_in(:)
    complex(c_double_complex), allocatable :: garbled_data_out(:)

    type(c_ptr) :: plan_garbled_forward, plan_garbled_backward

    real(16) :: t = 0.0
    real(16) :: dt = 1 / real(n - 1)

    real(16) :: randomized_noise
    integer :: i

    allocate(garbled_data_in(n))

    allocate(garbled_data_out(n / 2 + 1))


    do i = 1, n
        call random_number(random_noise)
        garbled_data_in(i) = cos(2 * pi * t * 4) + (random_noise  - 1) * 0.1
        t = t + dt
    end do


    plan_garbled_forward = fftw_plan_dft_r2c_1d(size(garbled_data_in), garbled_data_in, garbled_data_out, FFTW_ESTIMATE + FFTW_UNALIGNED)
    plan_garbled_backward = fftw_plan_dft_c2r_1d(size(garbled_data_in), garbled_data_out, garbled_data_in, FFTW_ESTIMATE + FFTW_UNALIGNED)

    t = 0.0 

    open(19, file='../res/garbled_cosinus', status='unknown')

    do i = 1, size(garbled_data_in)
        write(19, '(F15.10, F15.10)') t, garbled_data_in(i)
        t = t + dt
    end do

    close(19)


    call fftw_execute_dft_r2c(plan_garbled_forward, garbled_data_in, garbled_data_out)


    open(19, file='../res/garbled_fft', status='unknown')

    do i = 1, size(garbled_data_out)
        write(19, '(I15, F15.10)') i, abs(garbled_data_out(i))
        t = t + dt
    end do

    close(19)



    open(19, file='../res/filtered_fft', status='unknown')

    do i = 1, size(garbled_data_out)
        if(abs(garbled_data_out(i)) < 50) then
            garbled_data_out(i) = (0.0, 0.0)
        end if
        write(19, '(I15, F15.10)') i, abs(garbled_data_out(i))
    end do

    close(19)


    call fftw_execute_dft_c2r(plan_garbled_backward, garbled_data_out, garbled_data_in)


    t = 0.0

    open(19, file='../res/filtered_cosinus', status='unknown')

    do i = 1, size(garbled_data_in)
        write(19, '(I15, F15.10)') i, garbled_data_in(i) / size(garbled_data_in)
        t = t + dt
    end do

    close(19)


    call fftw_destroy_plan(plan_garbled_forward)
    call fftw_destroy_plan(plan_garbled_backward)

    deallocate(garbled_data_in)
    deallocate(garbled_data_out)
end program main