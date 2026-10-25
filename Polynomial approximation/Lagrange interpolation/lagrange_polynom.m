f = @(x) sin(x)
a = 0;
b = 3*pi;
n = 5;
h = (b-a)/n;
x = a:h:b;
y = zeros(1,length(x));
for i = 1:length(x)
  y(i) = lagrange(f, a, b , n, x(i));
endfor
plot(x, y, '-r')
hold on
n = 15;
h = (b-a)/n;
x = a:h:b;
y = zeros(1,length(x));
for i = 1:length(x)
  y(i) = lagrange(f, a, b , n, x(i));
endfor
plot(x, y, '-g')
n = 30;
h = (b-a)/n;
x = a:h:b;
y = zeros(1,length(x));
for i = 1:length(x)
  y(i) = lagrange(f, a, b , n, x(i));
endfor
plot(x, y, '-o')
x = a:0.01:b;
plot(x, f(x), '-b')
hold off
xlabel('x')
ylabel('y')
grid on

