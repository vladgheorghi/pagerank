Gheorghiu Doru-Vlad 
Facultatea de Automatica si Calculatoare, UPB
Grupa 312CA

README file - Metode Numerice - Tema 1 (PageRank) (Anul 1 Semestrul 2)


Descriere:

Tema are ca scop calcularea indicilor PageRank (cat de 'importanta' este o
pagina web) pentru un numar de site-uri despre care se dau listele de adiacenta
(numarul de siteuri si indicii siteurilor care au link catre acest site).
Datele sunt trimise din fisier si sunt afisate tot in fisier, indiicii PageRank
fiind calculati prin 3 metode.

Cerinta 1 - Iterative (Iterative.m)

Aceasta metoda implica aflarea matricei de adiacenta formata din listele de
adiacenta, apoi calcularea matricei stochastice, apoi aplicarea formulei prin
iteratii multiple pana cand eroarea este mai mica decat 'eps'.

Cerinta 2 - Algebraic (Algebraic.m)

Aceasta metoda implica aflarea matricei de adiacenta formata din listele de
adiacenta, apoi calcularea matricei stochastice si a inversei ei prin
algoritmul Gram-Schmidt, apoi aplicarea formulei specifice metodei.

Cerinta 3 - Apartenenta (Apartenenta.m)

Calculeaza valoarea functiei membru intr-un punct dat folosind limite laterale.

Mai multe detalii:

Pentru a fi mai usor de rezolvat tema, am incercat sa rezolv cerintele facand
analogia cu cod C, de asta citirea o fac element cu element.

In fisierul PageRank.m se face crearea fisierului .out si apelul functiilor
cu metodele de calcularea a indicilor PageRank pentru completarea fisierului.
