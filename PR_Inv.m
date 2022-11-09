function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt

	r = zeros(size(A));
	q = A;

  marime = size(A)(2);

	for i = 1:marime
	  r(i, i) = norm(q(:, i));
		q(:, i) = q(:, i) / r(i, i);
		r(i, (i+1):marime) = q(:, i)' * q(:, (i+1):marime);
		q(:, (i+1):marime) -= q(:, i) * q(:, i)' * q(:, (i+1):marime);
	endfor

  q = q';

  marime = size(r)(1);
  B = zeros(marime);
  reverse = fliplr(1:marime);

  for i = reverse
    for j = reverse
      sum = 0;
      sum += r(i, (i+1):marime) * B((i+1):marime, j);
      B(i, j) = (q(i, j) - sum) / r(i, i);
    endfor
  endfor

endfunction
