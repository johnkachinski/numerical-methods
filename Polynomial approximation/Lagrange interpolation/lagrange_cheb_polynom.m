f = @(x) sin(3*x)
a = -1;
b = 1;
n = 5;
t = zeros(1,n);
for i = 1:n
  t(i) = cos(pi*(2*i + 1)/(2*(n+1)));
endfor
x = zeros(1,n);
for i = 1:n
  x(i) = (a + b)/2 + t(i)*(b-a)/2;
endfor
y = zeros(1,length(x));
for i = 1:length(x)
  y(i) = lagrange_cheb(f, a, b , n, x(i));
endfor
plot(x, y, '-r')
hold on
n = 15;
t = zeros(1,n);
for i = 1:n
  t(i) = cos(pi*(2*i + 1)/(2*(n+1)));
endfor
x = zeros(1,n);
for i = 1:n
  x(i) = (a + b)/2 + t(i)*(b-a)/2;
endfor
y = zeros(1,length(x));
for i = 1:length(x)
  y(i) = lagrange_cheb(f, a, b , n, x(i));
endfor
plot(x, y, '-g')
n = 40;
t = zeros(1,n);
for i = 1:n
  t(i) = cos(pi*(2*i + 1)/(2*(n+1)));
endfor
x = zeros(1,n);
for i = 1:n
  x(i) = (a + b)/2 + t(i)*(b-a)/2;
endfor
y = zeros(1,length(x));
for i = 1:length(x)
  y(i) = lagrange_cheb(f, a, b , n, x(i));
endfor
plot(x, y, '-o')
x = a:0.01:b;
plot(x, f(x), '-b')
hold off
xlabel('x')
ylabel('y')
grid on
