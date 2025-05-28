%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% "artista.pl"
%% Identificação de artistas com base em:
%% 1. Título da musica
%% 2. Gênero musical
%% 3. Ano de lançamento
%% 4. BPM (batimentos por minuto)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Regras para questionar o utilizador
titulo(X) :- questiona(titulo, X).
genero(X) :- questiona(genero, X, [rock, pop, funk, jazz, eletronica, hip hop]).
ano(X) :- questiona(ano, X).
bpm(X) :- questiona(bpm, X).

%% Regra principal: encontra o ARTISTA
artista(Artista, Titulo) :-
    titulo(Titulo),
    genero(Genero),
    ano(Ano),
    bpm(BPM),
    musica(Artista, Titulo, Genero, Ano, BPM).

%% Objetivo do sistema: retornar o artista
objectivo(Artista-Titulo) :- artista(Artista,Titulo).