function result = cheb_c (f, a, b, m)
  x = zeros(1,m);
  for i = 1:m
    x(i) = cos(pi*(2*i - 1)/(2*(m)));
  endfor
  result = x;
endfunction
