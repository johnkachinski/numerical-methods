f = @(x,y) sin(x)*(1-y);
df = @(x) 1 - exp(cos(x) - 1);
disp('PC method')
x = 0;
y = df(x);
a = 0;
b = 6;
n = 50;
h = (b - a)/n;
x1 = a:0.01:b;
yn_pc = zeros(1,n+1);
x = a:h:b;
del_y = zeros(1, n+1);
x = a:h:b;
yn_pc(1) = y;
yn_pc(2) = y + h * f(a,y) + h^2/2 * ((f(a+h,y) - f(a,y))/h + f(a,y)*(f(a,y+h)-f(a,y)/h)) ;
for i = 3:n+1
  del_y(i) = yn_pc(i-1) + h/2 * (3*f(x(i-1), yn_pc(i-1)) - f(x(i-2), yn_pc(i-2)));
  yn_pc(i) = yn_pc(i-1) + h/2 * (f(x(i-1), yn_pc(i-1)) + f(x(i), del_y(i)));
end
yn_pc = yn_pc;
ya = df(x);
e = max(abs(yn_pc - ya))
plot(x1, df(x1), '-r')
hold on
plot(x, yn_pc, '-o')
#hold off
#xlabel('x')
#ylabel('y')
#grid on
f = @(x,y) 1 + sin(y) - 2*y;
#df = @(x) 1 - exp(cos(x) - 1);
disp('PC method')
x = 0;
y = 0;
a = 0;
b = 4;
n = 10;
h = (b - a)/n;
x1 = a:0.01:b;
yn_pc = zeros(1,n+1);
x = a:h:b;
del_y = zeros(1, n+1);
x = a:h:b;
yn_pc(1) = y;
yn_pc(2) = y + h * f(a,y) + h^2/2 * ((f(a+h,y) - f(a,y))/h + f(a,y)*(f(a,y+h)-f(a,y)/h)) ;
for i = 3:n+1
  del_y(i) = yn_pc(i-1) + h/2 * (3*f(x(i-1), yn_pc(i-1)) - f(x(i-2), yn_pc(i-2)));
  yn_pc(i) = yn_pc(i-1) + h/2 * (f(x(i-1), yn_pc(i-1)) + f(x(i), del_y(i)));
end
yn_pc = yn_pc;
ya = df(x);
e = max(abs(yn_pc - ya))
#plot(x1, df(x1), '-b')
#hold on
plot(x, yn_pc, '-p')
hold off
xlabel('x')
ylabel('y')
grid on
