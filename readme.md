# Sistema Pericial para Identificação de Artistas Musicais

## membros do Grupo
- 48736
- 53269

Este projeto implementa um sistema pericial simples em Prolog para identificar artistas musicais com base em informações fornecidas pelo usuário. O sistema utiliza uma base de conhecimento com músicas, artistas, gêneros, ano de lançamento e BPM (batimentos por minuto).

## Estrutura do Projeto

- **artista.pl**: Define as regras para identificar o artista a partir das respostas do usuário.
- **musicas.pl**: Base de conhecimento com registros de músicas, artistas, gêneros, anos e BPM.
- **perito.pl**: Implementa o shell do sistema pericial, permitindo carregar a base de conhecimento, interagir com o usuário e buscar soluções.
- **tcc_ceds_music.csv**: Arquivo de dados (não utilizado diretamente pelo sistema Prolog).
- **readme.md**: Este arquivo de documentação.

## Como Funciona

1. **Inicialização**: Execute o sistema carregando o arquivo `perito.pl` em um interpretador Prolog.
2. **Carregamento da Base de Conhecimento**: O usuário pode escolher qual base de conhecimento consultar (por exemplo, `musicas.pl`).
3. **Interação**: O sistema faz perguntas ao usuário sobre o título da música, gênero, ano de lançamento e BPM.
4. **Inferência**: Com base nas respostas, o sistema utiliza as regras definidas em [`artista.pl`](artista.pl) para buscar na base de conhecimento [`musicas.pl`](musicas.pl) e identificar o artista correspondente.
5. **Resultado**: O sistema retorna o nome do artista e o título da música correspondente às informações fornecidas.

## Exemplo de Uso

1. Inicie o Prolog e carregue o shell:
    ```prolog
    ?- consult(perito).
    ?- perito.
    ```
2. Siga as instruções do menu para consultar a base de conhecimento e solucionar o problema.
3. Responda às perguntas do sistema sobre a música desejada.
4. O sistema exibirá o artista identificado.

## Objetivo

O objetivo deste trabalho é demonstrar a aplicação de sistemas periciais utilizando Prolog, com foco em raciocínio baseado em regras e interação com o usuário para resolução de problemas no domínio musical.

## Como usar

- swipl
- [perito,artista].
- perito. 
- 1. 
- musicas. 
- 2. 
- "titulo". 
- genero. 
- ano. 
- bpm.