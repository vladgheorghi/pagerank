function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out

  % se calculeaza indicii PageRank prin metoda Iterative si Algebraic
  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d);

  % deschid fisierul
  f = fopen(nume, 'r');

  % citesc datele pana la val1 si val2
  n = fscanf(f, '%d', 1);
  A = zeros(n,n);

  for i = 1:n
    nod_i = fscanf(f, '%d', 1);

    nr_vecini(nod_i) = fscanf(f, '%d', 1);

    for j = 1:nr_vecini(i)
      vecin = fscanf(f, '%d', 1);

      if vecin != nod_i
        A(nod_i, vecin) = 1;
      else
        nr_vecini(nod_i) = nr_vecini(nod_i) - 1;
      endif

    endfor
  endfor

  % citesc val1 si val2
  val1 = fscanf(f, '%f', 1);
  val2 = fscanf(f, '%f', 1);

  fclose(f);

  % Se sorteaza vectorul de valori proprii descrescator si apoi se calculeaza
  % valoarea indicilor de apartenenta.

  site_count = size(R1)(1);

  % Se creeaza fisierul de iesire si se afiseaza folosind fprintf valorile in
  % ordinea dorita cu precizia ceruta de 6 zecimale.

  % deschid fisierul de iesire
  nume = [nume, '.out'];
  outf = fopen(nume, 'w');

  % afisez nr de siteuri
  fprintf(outf, "%d\n", site_count);

  % afisez indicii PageRank pentru metoda Iterative
  for i = 1:site_count
    fprintf(outf, "%f\n", R1(i));
  endfor

  fprintf(outf, "\n");

  % afisez indicii PageRank pentru metoda Algebraic
  for i = 1:site_count
    fprintf(outf, "%f\n", R2(i));
  endfor

  fprintf(outf, "\n");

  PR1 = R2;
  % sortez descrescator indicii
  for i = 1 : n-1
    for j = i + 1 : n
      if PR1(i) < PR1(j)
        aux = PR1(i);
        PR1(i) = PR1(j);
        PR1(j) = aux;
      endif
    endfor
  endfor

  % afisez cele n linii cu gradul de apartenenta
  for i = 1 : n
    for j = 1 : n
      if PR1(i) == R2(j)
        fprintf(outf, '%d ', i);
        fprintf(outf, '%d ', j);
        break
      endif
    endfor
    F = Apartenenta(PR1(i), val1, val2);
    fprintf(outf, '%f\n', F);
  endfor

  output_precision(7);

  fclose(outf);

endfunction
