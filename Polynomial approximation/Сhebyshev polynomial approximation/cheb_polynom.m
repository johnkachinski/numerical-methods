f = @(x) sin(3*x)
Tn = @(n, x) cos(n * acos(x))
a = -1;
b = 1;
n = 3;
M = 5;
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
#P = cheb_P(Tn, a0, an, 0.5)
x1 = a:0.01:b
plot(x1, f(x1), '-b')
hold on
plot(x1, cheb_P(Tn, a0, an, x1), '-r')
n = 6;
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
plot(x1, cheb_P(Tn, a0, an, x1), '-o')
hold off
xlabel('x')
ylabel('y')
grid on

