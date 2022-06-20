man(gencer).
man(can).
man(rasim).
woman(beyza).
woman(canan).
woman(meryem).

person([],_).
person([X|Y],Z) :- select(X, Z, S),person(Y, S).

clue1(Suspect) :- person([[A, redbag,_],[_,_,cookies],[_,_,chocolate],[_,_,avocado]], Suspect),man(A).
clue2(Suspect) :- person([[_,redbag,_], [_,_,onion]], Suspect).
clue3(Suspect) :- person([[beyza,yellowbag,_]], Suspect), person([[meryem,bluebag,_]], Suspect).
clue3(Suspect) :- person([[beyza,bluebag,_]], Suspect), person([[meryem,yellowbag,_]], Suspect).
clue4(Suspect) :- person([[_,_,avocado], [beyza,_,_], [gencer,_,_]], Suspect), person([[_,_,avocado], [_,bluebag,_], [_,orangebag,_]], Suspect).
clue5(Suspect) :- person([[A,yellowbag,cookies]], Suspect), woman(A).
clue6(Suspect) :- person([[can,purplebag,_]], Suspect).
clue6(Suspect) :- person([[gencer,purplebag,_]], Suspect).
clue7(Suspect) :- person([[_,orangebag,_], [_,_,chocolate]], Suspect).
clue8(Suspect) :- person([[meryem,_,_], [_,yellowbag,_], [_,greenbag,_]], Suspect).
clue9(Suspect) :- person([[gencer,_,onion]], Suspect).
clue10(Suspect,A) :- person([[A,greenbag,nuts]], Suspect).

guilty(X) :- 
	Suspect = [[_,orangebag,_],[_,bluebag,_],[_,redbag,_],[_,greenbag,_],[_,yellowbag,_],[_,purplebag,_]],
	clue1(Suspect),
	clue2(Suspect),
	clue3(Suspect),
	clue4(Suspect),
	clue5(Suspect),
	clue6(Suspect),
	clue7(Suspect),
	clue8(Suspect),
	clue9(Suspect),
	clue10(Suspect,X),
	person([[can,_,_],[rasim,_,_],[gencer,_,_],[meryem,_,_],[canan,_,_],[beyza,_,_]],Suspect),
	person([[_,_,avocado],[_,_,onion],[_,_,garlic],[_,_,nuts],[_,_,cookies],[_,_,chocolate]],Suspect),
	write(Suspect).
