function result = squarem(f,a,b,n)
  result = 0;
  h = (b-a)/n;
  x = a:h:b;
  result = f(x);
  result = h*sum(result);
endfunction
