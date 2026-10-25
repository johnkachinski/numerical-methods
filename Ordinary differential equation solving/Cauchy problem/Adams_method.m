f = @(x,y) 3*y./x;
df = @(x) x.^3;
a = -2;
b = -0.5;
x1 = a:0.01:b;
plot(x1, df(x1), '-b')
hold on
disp('RK2 method')
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
  k2 = f(x(i-1) + h, yn(i-1) + h * k1);
  yn(i) = yn(i-1) + h/2 * (k1 + k2);
end
yn = yn;
ya = df(x);
e = max(abs(yn - ya))
plot(x, yn, '-r')
disp('Adams 2 method')
x = -2;
y = df(x);
a = -2;
b = -0.5;
n = 10;
h = (b - a)/n;
yn_ad = zeros(1, n+1);
x = a:h:b;
yn_ad(1) = yn(1);
yn_ad(2) = yn(2);
for i = 3:n+1
  yn_ad(i) = yn_ad(i-1) + h/2 * (3*f(x(i-1), yn_ad(i-1)) - f(x(i-2), yn_ad(i-2)));
end
yn_ad = yn_ad;
ya = df(x);
e = max(abs(yn_ad - ya))
plot(x, yn_ad, '-o')
disp('RK3 method')
x = -2;
y = df(x);
a = -2;
b = -0.5;
n = 5;
h = (b - a)/n;
yn = zeros(1,n+1);
x = a:h:b;
yn(1) = y;
tic
for i = 2:n+1
  k1 = f(x(i-1), yn(i-1));
  k2 = f(x(i-1) + h/2, yn(i-1) + (h/2) * k1);
  k3 = f(x(i-1) + h, yn(i-1) - h * k1 + 2 * h * k2);
  yn(i) = yn(i-1) + h/6 * (k1 + 4 * k2 + k3);
end
toc
yn = yn;
ya = df(x);
e = max(abs(yn - ya))
plot(x, yn, '-g')
disp('Adams 3 method')
x = -2;
y = df(x);
a = -2;
b = -0.5;
n = 5;
h = (b - a)/n;
yn_ad = zeros(1, n+1);
x = a:h:b;
yn_ad(1) = yn(1);
yn_ad(2) = yn(2);
yn_ad(3) = yn(3);
tic
for i = 4:n+1
  yn_ad(i) = yn_ad(i-1) + h/12 * (23*f(x(i-1), yn_ad(i-1)) - 16*f(x(i-2), yn_ad(i-2)) + 5*f(x(i-3),yn_ad(i-3)));
end
toc
yn_ad = yn_ad;
ya = df(x);
e = max(abs(yn_ad - ya))
plot(x, yn_ad, '-p')
hold off
xlabel('x')
ylabel('y')
grid on
