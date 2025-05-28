%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% perito.pl
%%
%% Expert System Shell:
%% Permite carregar a base de conhecimento desejada.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- dynamic executa/2, conhece/3, objectivo/1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predicado principal: perito/0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

perito :-
    write('Concha simples de Sistema Pericial'), nl,
    write('Versão de 2025'), nl, nl,
    esperaOrdens(123).

esperaOrdens(MC) :-
    mostraComandos(MC),
    write('> '),
    read(Comando),
    executa(MC,Comando).

mostraComandos(123) :-
    write('Comandos disponíveis (introduza o número "1.", "2." ou "3."):'), nl,
    write('1 - Consultar uma Base de Conhecimento (BC)'), nl,
    write('2 - Solucionar'), nl,
    write('3 - Sair'), nl.

mostraComandos(23) :-
    write('Comandos disponíveis (introduza o número 2 ou 3):'), nl,
    write('2 - Solucionar'), nl,
    write('3 - Sair'), nl.

executa(_,1) :-
    write('Nome da BC: '),
    read(F),
    consult(F),
    write('BC consultada com sucesso.'), nl, nl,
    continua.

executa(_,2) :-
    soluciona,
    esperaOrdens(23).

executa(_,3) :-
    nl,
    write('Volte Sempre!'), nl,
    get0(_),
    halt.

executa(MC,X) :-
    write(X),
    write(' não é um comando válido!'), nl,
    esperaOrdens(MC).

continua :-
    retract(executa(_,1) :- _), % Ja carregamos uma BC.
    esperaOrdens(23). % De futuro já não temos essa opcão.

%%%%%%%%%%%%%%%
% soluciona/0
%%%%%%%%%%%%%%%

soluciona :-
    abolish(conhece,3),
    asserta(conhece(def,def,def)), % apenas para o predicado
    objectivo(X), % conhece/3 estar definido...
    nl, nl, write('Resposta encontrada: '),
    write(X),
    nl, nl.

soluciona :-
    nl, nl, write('Não foi encontrada resposta :-('), nl.

%%%%%%%%%%%%%%%
% questiona/2
%%%%%%%%%%%%%%%

questiona(Atributo,Valor) :-
    conhece(sim,Atributo,Valor).

questiona(Atributo,Valor) :-
    conhece(_,Atributo,Valor), !, fail.

questiona(Atributo,Valor) :-
    write(Atributo), write(': '),
    read(Valor),
    asserta(conhece(sim,Atributo,Valor)).

processa(sim,Atributo,Valor) :-
    asserta(conhece(sim,Atributo,Valor)).

processa(R,Atributo,Valor) :-
    asserta(conhece(R,Atributo,Valor)), !,
    fail.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% questiona/3
%
% Recurso a Menus:
% sao apresentados ao utilizador os valores
% que cada atributo pode assumir.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

questiona(Atr,Val,_) :-
    conhece(sim,Atr,Val).

questiona(Atr,_,_) :-
    conhece(sim,Atr,_), !, fail.

questiona(Atr,Val,ListaOpcoes) :-
    write(Atr),
    write(':'),
    write(ListaOpcoes), nl,
    read(X),
    processa(X,Atr,Val,ListaOpcoes).

processa(Val,Atr,Val,_) :-
    asserta(conhece(sim,Atr,Val)).

processa(X,Atr,_,ListaOpcoes) :-
    member(X,ListaOpcoes),
    asserta(conhece(sim,Atr,X)), !, fail.

processa(X,Atr,Val,ListaOpcoes) :-
    write(X),
    write(' não é valor aceite!'), nl,
    questiona(Atr,Val,ListaOpcoes).
    