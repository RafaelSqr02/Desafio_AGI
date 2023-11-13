*** Settings ***
Documentation    Desafio AGI
Resource         ../resource/Blog_AGI.robot

*** Test Cases ***

Cenário de teste 01: Realizar pesquisa por palavra-chave

    Dado que eu seja um usuário do sistema
    E for utilizar a função de pesquisa
    Quando eu digitar "Investimento" na funcionalidade de pesquisa
    E clicar na lupa ou der o enter
    Então como resposta devo obter uma lista de artigos relacioandos a minha pesquisa


Cenário de teste 02: Realizar pesquisa com artigos inexistentes no blog

    Dado que eu seja um usuário qualquer do sistema
    E for utilizar a função de pesquisa do sistema
    Quando eu digitar "Flamengo" na funcionalidade de pesquisa
    E clicar e der o enter
    Então como resposta o sistema deve retornar "Nenhum Resultado"
    
    
Cenário de teste 03: Realizar pesquisa sem preencher o campo e dar o Enter na pesquisa

    Dado que eu seja um usuário do sistema logado
    E for utilizar a função de pesquisa no sistema
    Quando eu não digitar nada na funcionalidade de pesquisa
    E clicar pesquisar
    Então como resposta o sistema deve retornar as notícias do blog em ordem cronológica
    
Cenário de teste 04: Alteração da cor do botão Pesquisar ao clicar no mesmo

    Dado que eu seja um usuário 
    E for utilizar a pesquisa do sistema
    Quando eu digitar "Investimento" na funcionalidade de pesquisa do sistema
    E clicar no botão pesquisar
    Então a cor do botão deverá ser alterada de branco para Azul
    E a pesquisa deverá ser realizada no sistema
