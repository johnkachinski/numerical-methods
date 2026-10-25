f = @(x) 0.5*x.*log(0.5*x.^2);
n = 10000
integral_square = squarem(f,1,3,n)
n = 100
integral_trapezoid = trapezoid(f,1,3,n)
n = 10
integral_simpson = simpson(f,1,3,n)
integral_ref = 1.55746
%wolfram result 1.55746
