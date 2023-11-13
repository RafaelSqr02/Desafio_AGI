*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://blogdoagi.com.br/

*** Keywords ***
# - Cenário de teste 01: Realizar pesquisa por palavra-chave
Dado que eu seja um usuário do sistema
    Open Browser    ${URL}    chrome 
    Maximize Browser Window        
    
E for utilizar a função de pesquisa
    Click Button    //*[@id="search-open"]      
Quando eu digitar "Investimento" na funcionalidade de pesquisa
    Input Text                       //*[@id="masthead"]/div[1]/div[2]/form/label/input    Investimento
    Sleep    5s
E clicar na lupa ou der o enter
    Press Keys                       //*[@id="masthead"]/div[1]/div[2]/form/label/input    ENTER
    Sleep    10s
Então como resposta devo obter uma lista de artigos relacioandos a minha pesquisa
    Wait Until Element Is Visible    //*[@id="primary"]/header/h1/span
    Close Browser


# #Cenário de teste 02: Realizar pesquisa com artigos inexistentes no blog
Dado que eu seja um usuário qualquer do sistema
    Open Browser    ${URL}    chrome 
    Maximize Browser Window      
E for utilizar a função de pesquisa do sistema
    Click Button    //*[@id="search-open"]      
Quando eu digitar "Flamengo" na funcionalidade de pesquisa
    Input Text                       //*[@id="masthead"]/div[1]/div[2]/form/label/input    Flamengo
    Sleep    5s
E clicar e der o enter
    Press Keys                       //*[@id="masthead"]/div[1]/div[2]/form/label/input    ENTER
Então como resposta o sistema deve retornar "Nenhum Resultado"
    Wait Until Element Is Visible    //*[@id="primary"]/section/header/h1
    Close Browser


#Cenário de teste 03: Realizar pesquisa sem preencher o campo e dar o Enter na pesquisa

Dado que eu seja um usuário do sistema logado
    Open Browser    ${URL}    chrome 
    Maximize Browser Window     
E for utilizar a função de pesquisa no sistema
    Click Button    //*[@id="search-open"]     
Quando eu não digitar nada na funcionalidade de pesquisa
    Sleep    2s
E clicar pesquisar
    Press Keys                       //*[@id="masthead"]/div[1]/div[2]/form/label/input    ENTER
Então como resposta o sistema deve retornar as notícias do blog em ordem cronológica
    Wait Until Element Is Visible    //*[@id="primary"]/header/h1
    Close Browser


#Cenário de teste 04: Alteração da cor do botão Pesquisar ao clicar no mesmo
Dado que eu seja um usuário 
    Open Browser    ${URL}    chrome 
    Maximize Browser Window   
E for utilizar a pesquisa do sistema
    Click Button    //*[@id="search-open"]  
Quando eu digitar "Investimento" na funcionalidade de pesquisa do sistema
    Input Text                       //*[@id="masthead"]/div[1]/div[2]/form/label/input    Investimentos
    Sleep    5s
E clicar no botão pesquisar
    Sleep    2s
Então a cor do botão deverá ser alterada de branco para Azul
    Press Keys                       //*[@id="masthead"]/div[1]/div[2]/form/label/input    ENTER 
E a pesquisa deverá ser realizada no sistema
    Wait Until Element Is Visible    //*[@id="primary"]/header/h1/span
    Close Browser
    