function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

  % deschid fisierul
  f = fopen(nume, 'r');

  % citesc nr de siteuri (noduri)
  n = fscanf(f, '%d', 1);

  % matricea de adiacenta a grafului (initial 0)
  A = zeros(n,n);

  for i = 1:n
    % citesc indexul siteului (nodului)
    nod_i = fscanf(f, '%d', 1);

    % citesc nr de siteuri care au link catre siteul nod_i
    nr_vecini(nod_i) = fscanf(f, '%d', 1);

    for j = 1:nr_vecini(i)
      % citesc fiecare site care are link catre siteul nod_i
      vecin = fscanf(f, '%d', 1);

      % ignor linkurile self-referenced si completez matricea de adiacenta
      if vecin != nod_i
        A(nod_i, vecin) = 1;
      else
        nr_vecini(nod_i) = nr_vecini(nod_i) - 1;
      endif

    endfor
  endfor

  % citesc restul de date nefolositoare
  garbage = fscanf(f, '%f', 1);
  garbage = fscanf(f, '%f', 1);

  % matricea stochastica (initial 0)
  M = zeros(n,n);

  % formez matricea stochastica
  for i = 1:n
    for j = 1:n
      if A(j, i) == 1
        M(i, j) = 1 / nr_vecini(j);
      endif
    endfor
  endfor

  % formula variantei iterative
  R_prev = ones(n, 1);
  unu_col = ones(n, 1);
  R_prev = (1 / n) * R_prev;

  R = d * M * R_prev + ((1 - d) / n) * unu_col;

  while norm(R - R_prev) >= eps
    R_prev = R;
    R = d * M * R_prev + ((1 - d) / n) * unu_col;
  endwhile

  fclose(f);

  % afisaza outputurile care nu sunt intregi cu 6 zecimale
  output_precision(7);
endfunction
