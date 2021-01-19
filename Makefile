default:
	@gfortran -c objects.f90
	@gfortran -c fvofi.f90
	@gfortran -c main.f90
	@gcc -c vofi.c
	@gfortran objects.o fvofi.o vofi.o main.o -o main.out

clean:
	@rm -f *.mod
	@rm -f *.o
	@rm -f *.out

