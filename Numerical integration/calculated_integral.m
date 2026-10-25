f = @(x) sqrt(x+1).*cos(x.^2)
f1 = @(x) exp(x)
p = @(x) x.^2
a = 0
b = 0.18
n = 1000
integral_square = squarem(f,a,b,n)
disp('Exact value of the integral')
integral = 0.187852

z_3 = [0.294998 0.652996 0.927006]
w_3 = [0.029951 0.146246 0.157136]

z_5 = [0.148946 0.365667 0.610114 0.826520 0.965421]
w_5 = [0.004114 0.032056 0.089200 0.126199 0.081765]

integral_gauss_christoffel_3 = dot(f1(z_3), w_3)
integral_gauss_christoffel_5 = dot(f1(z_5), w_5)
disp('Exact value of the integral')
integral = 0.71828
