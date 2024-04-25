task: task1
sql:
SELECT etterem_nev FROM menu WHERE etel_nev = 'zöldséges ragu'
MINUS
SELECT etterem_nev FROM menu WHERE etel_nev = 'palacsinta';
task: task2
sql:
SELECT etterem_nev, COUNT(*) db FROM menu NATURAL JOIN recept WHERE recept.alapanyag_nev = 'tojás' GROUP BY etterem_nev;
task: task3
sql:
SELECT DISTINCT etel_nev FROM recept NATURAL JOIN alapanyag WHERE (kaloria * mennyiseg < 300);
task: task4
sql:
SELECT etterem_nev FROM
(SELECT etterem_nev, COUNT(*) db FROM menu NATURAL JOIN
(SELECT etel_nev FROM recept
MINUS
SELECT etel_nev FROM recept NATURAL JOIN alapanyag WHERE kategoria = 'tejtermék') GROUP BY etterem_nev) WHERE db >= 2;
task: task5
sql:
SELECT etel_nev, db FROM
(SELECT etel_nev, COUNT(*) db FROM recept NATURAL JOIN alapanyag GROUP BY etel_nev);