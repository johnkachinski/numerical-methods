function result = lagrange (f, a, b, n, x1)
  h = (b-a)/n;
  x = a:h:b;
  y = f(x);
  i = 1;
  while i <= length(x)
    l = 1;
    for j = 1:length(x)
      if j!=i
        l = l * (x1 - x(j))/(x(i)-x(j));
      endif
    endfor
    y(i) = y(i)*l;
    i = i+1;
  endwhile
  result = sum(y);
endfunction
