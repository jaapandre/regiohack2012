
DATASET ACTIVATE DataSet3.
* Chart Builder.

String gem_sexe (a100).
compute gem_sexe=CONCAT(Gemeenten, Geslacht).
freq gem_sexe.



GRAPH
  /LINE(MULTIPLE)=MEAN(aantalx1000) BY Prognosejaar BY leeftijdsklasse
  /PANEL COLVAR=Geslacht COLOP=CROSS .




GRAPH
  /LINE(MULTIPLE)=MEAN(aantalx1000) BY Prognosejaar BY leeftijdsklasse
  /PANEL COLVAR=Geslacht COLOP=CROSS ROWVAR=Gemeenten ROWOP=CROSS.

freq gemeenten.
compute almelo	=0.
compute borne	=0.
compute dinkelland=0.	
compute enschede	=0.
compute haaksbergen	=0.
compute hellendoorn	=0.
compute hengelo	=0.
compute hofVanTwente	=0.
compute losser	=0.
compute oldenzaal	=0.
compute rijssen=0.
compute tubbergen	=0.
compute twenterand	=0.
compute wierden	=0.


if (gemeenten="Almelo") almelo=1.
if (gemeenten="Borne")	 borne=1.
if (gemeenten="Dinkelland") dinkelland=1.
if (gemeenten="Enschede") enschede=1.
if (gemeenten="Haaksbergen") haaksbergen=1.
if (gemeenten="Hellendoorn") hellendoorn=1.
if (gemeenten="Hengelo") hengelo=1.
if (gemeenten="Hof van Twente") hofVanTwente=1.
if (gemeenten="Losser") losser=1.
if (gemeenten="Oldenzaal") oldenzaal=1.
if (gemeenten="Rijssen-Holten") rijssen=1.
if (gemeenten="Tubbergen") tubbergen=1.
if (gemeenten="Twenterand") twenterand=1.
if (gemeenten="Wierden") wierden=1.




execute.










USE ALL.
COMPUTE filter_$=(leeftijdc < 7).
VARIABLE LABELS filter_$ 'leeftijdc < 7 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


MEANS TABLES=aantalx1000 BY Gemeenten BY Geslacht BY Prognosejaar
  /CELLS MEAN COUNT STDDEV.

