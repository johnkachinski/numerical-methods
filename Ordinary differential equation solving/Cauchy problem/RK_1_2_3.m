f = @(x,y) y./x + 5 *x.* cos(5*x)
df = @(x) x.*sin(5*x);
disp('RK1 method')
x = -2;
y = df(x);
a = -2;
b = -0.5;
n = 300;
h = (b - a)/n;
yn = zeros(1,n+1);
x = a:h:b;
yn(1) = y;
for i = 2:n+1
  yn(i) = yn(i-1) + h * f(x(i-1), yn(i-1));
end
yn = yn;
x1 = a:0.01:b;
ya = df(x);
e = max(abs(yn - ya))
plot(x1, df(x1), '-b')
hold on
plot(x, yn, '-r')
disp('RK2 method')
x = -2;
y = df(x);
a = -2;
b = -0.5;
n = 15;
h = (b - a)/n;
yn = zeros(1,n+1);
x = a:h:b;
yn(1) = y;
for i = 2:n+1
  k1 = f(x(i-1), yn(i-1));
  k2 = f(x(i-1) + h, yn(i-1) + h * k1);
  yn(i) = yn(i-1) + h/2 * (k1 + k2);
end
yn = yn;
ya = df(x);
e = max(abs(yn - ya))
plot(x, yn, '-o')
disp('RK3 method')
x = -2;
y = df(x);
a = -2;
b = -0.5;
n = 10;
h = (b - a)/n;
yn = zeros(1,n+1);
x = a:h:b;
yn(1) = y;
for i = 2:n+1
  k1 = f(x(i-1), yn(i-1));
  k2 = f(x(i-1) + h/2, yn(i-1) + (h/2) * k1);
  k3 = f(x(i-1) + h, yn(i-1) - h * k1 + 2 * h * k2);
  yn(i) = yn(i-1) + h/6 * (k1 + 4 * k2 + k3);
end
yn = yn;
ya = df(x);
e = max(abs(yn - ya))
plot(x, yn, '-p')
hold off
xlabel('x')
ylabel('y')
grid on

