function result = lagrange_cheb (f, a, b, n, x1)
  t = zeros(1,n);
  for i = 1:n
    t(i) = cos(pi*(2*i + 1)/(2*(n+1)));
  endfor
  x = zeros(1,n);
  for i = 1:n
    x(i) = (a + b)/2 + t(i)*(b-a)/2;
  endfor
  y = f(x);
  i = 1;
  while i <= n
    l = 1;
    for j = 1:n
      if j!=i
        l = l * (x1 - x(j))/(x(i)-x(j));
      endif
    endfor
    y(i) = y(i)*l;
    i = i+1;
  endwhile
  result = sum(y);
endfunction
