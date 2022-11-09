function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1

	% calculez limitele laterale
  % ls(val1) = ld(val1) deci b = -a*val1
  % ls(val2) = ld(val2) deci 1/ (val2 - val)

  a = 1 / (val2 - val1);
  b = - a * val1;

  % x apartine (-inf, val1)
  if x < val1
      y = 0;
  endif
  % x apartine [val1, val2]
  if x >= val1 && x <= val2
    y = a * x + b;
  % x apartine [val2, inf)
  else
   y = 1;
  endif

endfunction
