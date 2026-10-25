f = @(x) x .* exp(-x);
e_u = @(x) (1 - x).*exp(-x);
p = @(x) 1;
q = @(x) -1;
a = 0;
b = 1;
n = 10;
h = (b - a)/n;
x = a:h:b;
x_a = 0;
x_b = 1;
du_a = -2;
u_b = 0;
#k0 = @(x) -2*x + 2;
k0 = @(x) 1 - x
A = zeros(n + 1,n + 1);
for i = 1:n+1
  for j = 1:n+1
    A(i,j) = (p_ort_k(j, x(i) + 2*h) - 2*p_ort_k(j, x(i) + h) + p_ort_k(j,x(i)))/h^2 + (p_ort_k(j,x(i)+h) - p_ort_k(j,x(i)))/h - p_ort_k(j,x(i));
  end
end
A = A;
F = zeros(1,n+1);
for i = 1:n+1
  F(i) = f(x(i))-((k0( x(i) + 2*h) - 2*k0( x(i) + h) + k0(x(i)))/h^2 + (k0(x(i)+h) - k0(x(i)))/h - k0(x(i)));
end
F = F;
c = linsolve(A,F');
c = c';
un = zeros(1,n+1);
for i=1:n+1
  un(i) = k0(x(i));
end
un = un;
for i = 1:n+1
  for j = 1:n+1
    un(i) = un(i) + c(j)*p_ort_k(j,x(i));
  end
end
un = un;
x1 = a:0.1:b;
plot(x1, e_u(x1), '-r')
hold on
plot(x, un, '-o')
hold off
xlabel('x')
ylabel('y')
grid on
