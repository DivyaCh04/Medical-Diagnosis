start:- hypothesis(Disease),
write('I believe you have: '),
write(Disease),
nl,
undo.
hypothesis(cold):- cold, !.
hypothesis(flu):- flu, !.
hypothesis(ebola):- ebola, !.
hypothesis(measles):- measles, !.
hypothesis(typhoid):-typhoid,!.
hypothesis(malaria):-malaria,!.
hypothesis(diarrhoea):-diarrhoea,!.
hypothesis(unknown). /* no diagnosis*/
typhoid:-
verify(high_fever),
verify(headache),
verify(vomiting),
verify(stomach_pain),
verify(loose_stools).
diarrhoea:-
verify(abdominal_pains),
verify(loose_stools),
verify(nausea),
verify(vomiting).
malaria:-
verify(chills),
verify(fatigue),
verify(fever),
verify(shivering),
verify(sweating),
verify(fast_heart_rate),
verfiy(headache),
verify(nausea).
cold :-
verify(headache),
verify(runny_nose),
verify(sneezing),
verify(sore_throat).
flu :-
verify(fever),
verify(headache),
verify(chills),
verify(body_ache).
ebola :-
verify(headache),
verify(rash),
verify(nausea),
verify(bleeding).
measles :-
verify(fever),
verify(runny_nose),
verify(rash),
verify(conjunctivitis).
ask(Question) :-
write('Does the patient have the following symptom: '),
write(Question),
write('? '),
read(Response),
nl,
( (Response == yes ; Response == y)
->
assert(yes(Question)) ;
assert(no(Question)), fail).
:- dynamic yes/1,no/1.
verify(S) :- (yes(S) -> true ;
(no(S) -> fail ;
ask(S))).
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.







