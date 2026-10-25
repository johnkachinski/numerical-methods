f1 = @(x,y) sin(x+y)-1.1*x-0.1;
f2 = @(x,y) x^2+y^2-1;
g1 = @(x,y) (sin(x+y)-0.1)/1.1
g2 = @(x,y) sqrt(abs(1-x^2))
#g2 = @(x,y) -sqrt(abs(1-x^2))
x = linspace(-5, 3, 100);
y = linspace(-5, 5, 100);
[X, Y] = meshgrid(x, y);
F1 = X.^2 + Y.^2 - 1;
F2 = sin(X+Y)-1.1*X-0.1;
contour(X, Y, F1, [0 0], 'b-', 'LineWidth', 2);
hold on
contour(X, Y, F2, [0 0], 'r-', 'LineWidth', 2);
axis equal;
grid on;
disp('SI method')
x0=-1
y0=0
h=1*e^(-5);
dg1x = (g1(x0 + h,y0) - g1(x0 - h,y0)) / (2*h);
dg1y = (g1(x0,y0+h) - g1(x0,y0-h)) / (2*h);
dg2x = (g2(x0 + h,y0) - g2(x0 - h,y0)) / (2*h);
dg2y = (g2(x0,y0+h) - g2(x0,y0-h)) / (2*h);
tic
xk=g1(x0,y0);
yk=g2(x0,y0);
count=1;
eps = 5;
while eps>0.000001
  x0 = xk;
  y0 = yk;
  dg1x = (g1(x0 + h,y0) - g1(x0 - h,y0)) / (2*h);
  dg1y = (g1(x0,y0+h) - g1(x0,y0-h)) / (2*h);
  dg2x = (g2(x0 + h,y0) - g2(x0 - h,y0)) / (2*h);
  dg2y = (g2(x0,y0+h) - g2(x0,y0-h)) / (2*h);
  jacobian = [dg1x dg1y;dg2x dg2y];
  jacobian = det(jacobian)
  xk=g1(x0,y0);
  yk=g2(x0,y0);
  count=count+1;
  eps = norm([xk,yk]-[x0,y0])/norm([xk,yk]);
end
toc
count
xk
yk
f1(xk,yk)
f2(xk,yk)
disp('Newton method')
x0=0.5
y0=0.5
h=1*e^(-5);
df1x = (f1(x0 + h,y0) - f1(x0 - h,y0)) / (2*h);
df1y = (f1(x0,y0+h) - f1(x0,y0-h)) / (2*h);
df2x = (f2(x0 + h,y0) - f2(x0 - h,y0)) / (2*h);
df2y = (f2(x0,y0+h) - f2(x0,y0-h)) / (2*h);
jacobian = [df1x df1y;df2x df2y];
F = [f1(x0,y0);f2(x0,y0)];
deltaxy = linsolve(jacobian,F);
tic
xk = x0 - deltaxy(1,1);
yk = x0 - deltaxy(2,1);
count = 1;
eps = 5;
while eps>0.000001
  x0 = xk;
  y0 = yk;
  df1x = (f1(x0 + h,y0) - f1(x0 - h,y0)) / (2*h);
  df1y = (f1(x0,y0+h) - f1(x0,y0-h)) / (2*h);
  df2x = (f2(x0 + h,y0) - f2(x0 - h,y0)) / (2*h);
  df2y = (f2(x0,y0+h) - f2(x0,y0-h)) / (2*h);
  jacobian = [df1x df1y;df2x df2y];
  F = [f1(x0,y0);f2(x0,y0)];
  deltaxy = linsolve(jacobian,F);
  xk = x0 - deltaxy(1,1);
  yk = y0 - deltaxy(2,1);
  count=count+1;
  eps = norm([xk,yk]-[x0,y0])/norm([xk,yk]);
end
toc
count
xk
yk
f1(xk,yk)
f2(xk,yk)

