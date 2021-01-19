program main
    use objects
    use fvofi
    implicit none

    real(kind=c_float) :: phi
    real(kind=c_float) :: x

    type(sphere_t), target :: sphere
    type(plane_t), target :: plane

    type(c_ptr) :: usr
    type(c_funptr) :: fun

    x = 2.0

    sphere%radius = 1.0
    sphere%center = 0.0

    usr = c_loc(sphere)
    fun = c_funloc(cdistance2sphere)

    phi = evaluate(fun, x, usr)

    write(*, 1) "Distance to sphere = ", phi

    x = 2.0

    plane%normal = 1.0
    plane%intercept = 0.0

    usr = c_loc(plane)
    fun = c_funloc(cdistance2plane)

    phi = evaluate(fun, x, usr)

    write(*, 1) " Distance to plane = ", phi

1   format (a21, f5.1)

end program main

