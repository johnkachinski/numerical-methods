function result = simpson (f,a,b,n)
  result = 0;
  h = (b-a)/n;
  x = a:h:b;
  result = result + f(x(1)) + f(x(length(x)));
  for i = 2:length(x)-1
    if mod(i,2) == 0
      result = result + 4*f(x(i));
    else
      result = result + 2*f(x(i));
    end
  end
  result = (h/3)*result;
endfunction
