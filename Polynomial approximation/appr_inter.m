f = @(x) (x.^2 .* (cosh(x)-1))./(1 + x.^2);
Tn = @(n, x) cos(n * acos(x));
a = -1;
b = 1;
n = 9;
M = 10;
x = cheb_c(f, a, b, M);
y = f(x);
a0 = 1/M * sum(y);
an = zeros(1,n);
for i = 1:n
  for j = 1:M
    an(i) = an(i) + 2/M * y(j) * Tn(i, x(j));
  end
end
an = an;
x = a:0.1:b;
P = cheb_P(Tn, a0, an, x);
u = f(x);
if max(abs(P-u)) <= 0.001
  disp('Good')
else
  disp('Bad')
end
f = @(x) atanh(x)
a = -0.9;
b = 0.9;
n = 10;
t = zeros(1,n);
for i = 1:n
  t(i) = cos(pi*(2*i + 1)/(2*(n+1)));
endfor
x = zeros(1,n);
for i = 1:n
  x(i) = (a + b)/2 + t(i)*(b-a)/2;
endfor
xx = a:0.1:b;
plot(xx, atanh(xx), '-b')
hold on
y = zeros(1,length(x))
for i = 1:length(x)
  y(i) = lagrange_cheb(f, a, b, n, x(i));
end
plot(x, y, '-r')
hold off
xlabel('x')
ylabel('y')
grid on
