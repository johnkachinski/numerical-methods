function result = trapezoid (f,a,b,n)
  result = 0;
  h = (b-a)/n;
  x = a:h:b;
  for i = 1:length(x)-1
    result = result + (f(x(i))+f(x(i+1)))*0.5;
  end
  result = h*result;
endfunction
