%FetsInicials

patient(a).
patient(b).
patient(c).
patient(d).

diabetes(a).
diabetes(b).

diet(a).

oralMedicine(b).

%blood glucose
glucose(a, 160).
glucose(b, 180).
glucose(c, 100).
glucose(d, 160).


%regles

noInsulin(P):-patient(P),(diabetes(P), diet(P), glucose(P,X), X=<150; not(diabetes(P)), glucose(P,X), X=<150.0).

lowDose(P):-patient(P),(diabetes(P), diet(P), glucose(P,X), X > 150, X < 200;not(diabetes(P)), glucose(P,X), X >= 150).

mediumDose(P):-patient(P),(diabetes(P), diet(P), glucose(P,X), X >= 200;
               diabetes(P), oralMedicine(P), glucose(P,X), X < 200).

highDose(P):-diabetes(P), oralMedicine(P), glucose(P,X), X >= 200.

dose(noInsulin,P):- patient(P), noInsulin(P).
dose(lowDose,P):- patient(P), lowDose(P).
dose(mediumDose,P):- patient(P), mediumDose(P).
dose(highDose,P):- patient(P), highDose(P).




