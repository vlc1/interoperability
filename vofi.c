typedef float (*integrand) (float, void*);

float evaluate(integrand fun, float x, void* usr)
{
	return fun(x, usr);
}

