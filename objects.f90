! https://gcc.gnu.org/onlinedocs/gfortran/Working-with-Pointers.html#Working-with-Pointers
module objects
    use, intrinsic :: iso_c_binding
    implicit none

    type sphere_t
        real(kind=c_float) :: radius
        real(kind=c_float) :: center
    end type sphere_t

    type plane_t
        real(kind=c_float) :: normal
        real(kind=c_float) :: intercept
    end type plane_t

contains

    real(kind=c_float) function cdistance2sphere(x, usr) bind(c)
        implicit none

        real(kind=c_float), intent(in), value :: x
        type(c_ptr), intent(in), value :: usr

        type(sphere_t), pointer :: object

        call c_f_pointer(usr, object)

        cdistance2sphere = distance2sphere(x, object)
    end function cdistance2sphere

    real(kind=c_float) function distance2sphere(x, object)
        implicit none

        real(kind=c_float), intent(in) :: x
        type(sphere_t), intent(in) :: object

        distance2sphere = abs(x - object%center) - object%radius
    end function distance2sphere

    real(kind=c_float) function cdistance2plane(x, usr) bind(c)
        implicit none

        real(kind=c_float), intent(in), value :: x
        type(c_ptr), intent(in), value :: usr

        type(plane_t), pointer :: object

        call c_f_pointer(usr, object)

        cdistance2plane = distance2plane(x, object)
    end function cdistance2plane

    real(kind=c_float) function distance2plane(x, object)
        implicit none

        real(kind=c_float), intent(in) :: x
        type(plane_t), intent(in) :: object

        distance2plane = object%normal * x + object%intercept
    end function distance2plane

end module objects

