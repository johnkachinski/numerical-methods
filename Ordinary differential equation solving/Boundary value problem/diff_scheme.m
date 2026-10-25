f = @(x) x .* exp(-x);
e_u = @(x) (1 - x).*exp(-x);
p = @(x) 1;
q = @(x) -1;
disp('Diff scheme');
x1 = a:0.1:b;
y = e_u(x1);
plot(x1, y, '-b')
hold on
a = 0;
b = 1;
n = 50;
h = (b - a)/n;
x_a = 0;
x_b = 1;
du_a = -2;
g = (h^2/2) * (p(x_a)*du_a - f(x_a)) - h*du_a;
u_b = 0;
x = a:h:b;
A = zeros(n-1, n-1);
F = zeros(1, n-1);
j = 1;
for i = 1:n-1
  F(1,i) = h^2 * f(x(i));
end
F = F;
for i = 2:n-2
  A(i, j) = 1 - h/2 * p(x(i));
  A(i, j + 1) = -2 + h^2 * q(x(i));
  A(i, j + 2) = 1 + h/2 * p(x(i));
  j = j+1;
end
A = A;
#A(1,1) = -2 + h^2 * q(x(1));
A(1, 1) = (1 - h/2 * p(x(1))) + (-2 + h^2 * q(x(1)));
A(1,2) = 1 + h/2 * p(x(1));
A(n-1, n-2) = 1 - h/2 * p(x(n-1));
A(n-1, n-1) = -2 + h^2 * q((x(n-1)));
F(1, 1) = F(1, 1) - (1 - h/2 * p(x(1))) * g;
F(1, n - 1) = F(1, n - 1) -  (1 + h/2 * p(x(n-1))) * u_b;
F = F;
A = A;
u = linsolve(A,F');
u = u';
un = zeros(1,n+1);
un(1,1) = u(1) + g;
un(1,length(un)) = u_b;
for i = 2:n
  un(1,i) = u(i-1);
end
un = un;
plot(x, un, '-o')
hold off
xlabel('x')
ylabel('y')
grid on

