f1 = @(x,y,dy) dy;
f2 = @(x, y, dy) -dy + y + x.*exp(-x);
e_u = @(x) (1 - x).*exp(-x);
a = 0;
b = 1;
n = 10;
h = (b - a)/n;
x = a:h:b;
du_a = -2;
u_b = 0;
s0 = 0;
s1 = 3;
y2 = du_a;
a1 = sht_fun(f1, f2, s0, y2, x, h);
a2 = sht_fun(f1, f2, s1, y2, x, h);
s3 = s0 - a1(length(a1)) * (s1 - s0)/(a2(length(a2)) - a1(length(a1)));
plot(x, e_u(x), '-r')
hold on
y = sht_fun(f1, f2, s3, y2, x, h)
plot(x, y, '-o')
hold off
xlabel('x')
ylabel('y')
grid on
