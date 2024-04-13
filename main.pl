/* Adivinhe o personagem de Stardew Valley
    inicie com o comando ?- iniciar. */

iniciar :- hipotese(Personagem),
      write('Eu acho que o personagem é: '),
      write(Personagem),
      nl,
      undo.

/* hipoteses a serem testadas */
hipotese(george) :- george, !.
hipotese(linus) :- linus, !.
hipotese(lewis) :- lewis, !.
hipotese(vincent) :- vincent, !.
hipotese(feiticeiro) :- feiticeiro, !.
hipotese(gus) :- gus, !.
hipotese(willy) :- willy, !.
hipotese(clint) :- clint, !.
hipotese(demetrius) :- demetrius, !.
hipotese(pierre) :- pierre, !.
hipotese(kent) :- kent, !.
hipotese(evelyn) :- evelyn, !.
hipotese(jas) :- jas, !.
hipotese(caroline) :- caroline, !.
hipotese(marnie) :- marnie, !.
hipotese(robin) :- robin, !.
hipotese(jodi) :- jodi, !.
hipotese(pam).

/* Regras de identificacao dos personagens */
george :- homem, idoso, verificar('é ranzinza').
linus :- homem, idoso, verificar('mora em uma barraca').
lewis :- homem, idoso.
vincent :- homem, crianca.
feiticeiro :- homem, verificar('tem cabelo roxo').
gus :- homem, bigode, verificar('trabalha à noite').
willy :- homem, bigode, verificar('usa chapéu').
clint :- homem, bigode.
demetrius :- homem, verificar('é negro').
pierre :- homem, verificar('usa óculos').
kent :- homem.

evelyn :- idoso.
jas :- crianca.
caroline :- verificar('tem cabelo verde').
marnie :- cabelo_amarrado, negocio_na_cidade, verificar('mora em um rancho').
robin :- cabelo_amarrado, negocio_na_cidade.
jodi :- cabelo_amarrado.

/* regras de classificacao */
homem :- verificar('é homem').
idoso :- verificar('é idoso(a)').
crianca :- verificar('é criança').
bigode :- verificar('tem bigode').
cabelo_amarrado :- verificar('usa cabelo amarrado').
negocio_na_cidade :- verificar('tem algum negócio na cidade').

/* Como fazer perguntas */
perguntar(Questao) :-
    write('O personagem tem o seguinte atributo: '),
    write(Questao),
    write('? (s|n) '),
    read(Resposta),
    nl,
    ( (Resposta == sim ; Resposta == s)
      ->
       assert(yes(Questao)) ;
       assert(no(Questao)), fail).

:- dynamic yes/1,no/1.

/* Como verificar algo */
verificar(S) :-
   (yes(S)
    ->
    true ;
    (no(S)
     ->
     fail ;
     perguntar(S))).

/* Desfaz todas as afirmacoes sim / nao */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
