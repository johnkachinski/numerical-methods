f = @(x,y) -y./x;
df = @(x) -1./x;
a = -0.5;
b = -0.05;
x1 = a:0.01:b;
plot(x1, df(x1), '-b')
hold on
disp('RK2 method')
x = -0.5;
y = df(x);
a = -0.5;
b = -0.05;
n = 100;
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
x = -0.5;
y = df(x);
a = -0.5;
b = -0.05;
n = 100;
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
plot(x, yn_ad, '-g')
disp('PC method')
x = -0.5;
y = df(x);
a = -0.5;
b = -0.05;
n = 100;
h = (b - a)/n;
yn_pc = zeros(1, n+1);
del_y = zeros(1, n+1);
x = a:h:b;
yn_pc(1) = yn(1);
yn_pc(2) = yn(2);
for i = 3:n+1
  del_y(i) = yn_pc(i-1) + h/2 * (3*f(x(i-1), yn_pc(i-1)) - f(x(i-2), yn_pc(i-2)));
  yn_pc(i) = yn_pc(i-1) + h/2 * (f(x(i-1), yn_pc(i-1)) + f(x(i), del_y(i)));
end
yn_pc = yn_pc;
ya = df(x);
e = max(abs(yn_pc - ya))
plot(x, yn_pc, '-o')
disp('PC method, denser to the end')
x = -0.5;
y = df(x);
a = -0.5;
b = -0.05;
n = 100;
h = (b - a)/n;
yn_pc = zeros(1, n+1);
del_y = zeros(1, n+1);
t = linspace(0, 1, n+1);
p = 1.0001;
x = a + (b - a) * t.^p;
yn_pc(1) = yn(1);
yn_pc(2) = yn(2);
for i = 3:n+1
  del_y(i) = yn_pc(i-1) + h/2 * (3*f(x(i-1), yn_pc(i-1)) - f(x(i-2), yn_pc(i-2)));
  yn_pc(i) = yn_pc(i-1) + h/2 * (f(x(i-1), yn_pc(i-1)) + f(x(i), del_y(i)));
end
yn_pc = yn_pc;
ya = df(x);
e = max(abs(yn_pc - ya))
plot(x, yn_pc, '-p')
hold off
xlabel('x')
ylabel('y')
grid on
