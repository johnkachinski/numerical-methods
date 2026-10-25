f=@(x) exp(-x)-x
df=@(x) -exp(-x)-1
disp('SI method')
del=0.5;
x0=0;
tic
xk=x0+del*f(x0);
eps=abs(xk-x0);
count=1;
while eps>0.0001 || f(xk)>0.0001
  x0=xk;
  xk=x0+del*f(x0);
  eps=abs(xk-x0);
  count=count+1;
endwhile
toc
count
xk
y=f(xk)
disp('Newton method')
x0=0
tic
xk=x0-(1/df(x0))*f(x0);
eps=abs(xk-x0);
count=1;
while eps>0.0001 || f(xk)>0.0001
  x0=xk;
  xk=x0-(1/df(x0))*f(x0);
  eps=abs(xk-x0);
  count=count+1;
endwhile
toc
count
xk
y=f(xk)
disp('One point method Halley')
x0=0
tic
h=1*e^(-5)
d2f = (df(x0 + h) - df(x0 - h)) / (2*h)
xk=x0-(f(x0)*df(x0))/(df(x0)^2-0.5*d2f*f(x0));
eps=abs(xk-x0);
count=1;
while eps>0.0001 || f(xk)>0.0001
  x0=xk;
  d2f = (df(x0 + h) - df(x0 - h)) / (2*h)
  xk=x0-(f(x0)*df(x0))/(df(x0)^2-0.5*d2f*f(x0));
  eps=abs(xk-x0);
  count=count+1;
endwhile
toc
count
xk
y=f(xk)
disp('Some points method')
x0=0
tic
xk=x0-(f(x0)+f(x0-f(x0)/df(x0)))/df(x0);
eps=abs(xk-x0);
count=1;
while eps>0.0001 || f(xk)>0.0001
  x0=xk;
  xk=x0-(f(x0)+f(x0-f(x0)/df(x0)))/df(x0);
  eps=abs(xk-x0);
  count=count+1;
endwhile
toc
count
xk
y=f(xk)
disp('Secants method')
x0=0.00000001
xk_1=0
tic
xk=x0-(f(x0)*(x0-xk_1))/(f(x0)-f(xk_1));
eps=abs(xk-x0);
count=1;
while eps>0.0001 || f(xk)>0.0001
  xk_1=x0
  x0=xk;
  xk=x0-(f(x0)*(x0-xk_1))/(f(x0)-f(xk_1));
  eps=abs(xk-x0);
  count=count+1;
endwhile
toc
count
xk
y=f(xk)

