module fvofi
    implicit none

    interface
        real(kind=c_float) function evaluate(fun, x, usr) bind(c)
            use, intrinsic :: iso_c_binding
            type(c_funptr), intent(in), value :: fun
            real(kind=c_float), intent(in), value :: x
            type(c_ptr), intent(in), value :: usr
        end function evaluate
    end interface

end module fvofi

