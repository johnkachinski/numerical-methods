function result = cheb_P (Tn, a0, a, x)
  P = a0 * Tn(0, x);
  for i = 1:length(a)
    P = P + a(i) * Tn(i, x);
  endfor
  result = P;
endfunction
