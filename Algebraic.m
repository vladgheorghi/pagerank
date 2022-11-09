function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari:
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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

  % vector coloana cu valoarea 1
  unu_col = ones(n, 1);

  % matrice unitate de ordin n
  In = eye(n);

  invM = In - M * d;

  % aflu inversa matricei stochastice folosind Gram-Schmidt
  invM = PR_Inv(invM);

  % formula pentru varianta algebrica
  R = invM * ((1 - d) / n) * unu_col;

  output_precision(7);
  fclose(f);
endfunction
