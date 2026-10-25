function result = sht_fun (f1, f2, y1, y2, x, h)
  yn_1 = zeros(1, length(x));
  yn_2 = zeros(1, length(x));
  yn_1(1) = y1;
  yn_2(1) = y2;
  for i = 1:length(x)-1
    k1 = f1(x(i), yn_1(i), yn_2(i));
    l1 = f2(x(i), yn_1(i), yn_2(i));
    k2 = f1(x(i)+h/2, yn_1(i)+h/2 * k1, yn_2(i)+h/2 * l1);
    l2 = f2(x(i)+h/2, yn_1(i)+h/2 * k1, yn_2(i)+h/2 * l1);
    k3 = f1(x(i)+h/2, yn_1(i)+h/2 * k2, yn_2(i)+h/2 * l2);
    l3 = f2(x(i)+h/2, yn_1(i)+h/2 * k2, yn_2(i)+h/2 * l2);
    k4 = f1(x(i) + h, yn_1(i) + h * k3, yn_2(i) + h * l3);
    l4 = f2(x(i) + h, yn_1(i) + h * k3, yn_2(i) + h * l3);
    yn_1(i+1) = yn_1(i) + h/6 * (k1 + 2*k2 + 2*k3 + k4);
    yn_2(i+1) = yn_2(i) + h/6 * (l1 + 2*l2 + 2*l3 + l4) ;
  end
  yn_1;
  yn_2;
  result = yn_1;
endfunction
