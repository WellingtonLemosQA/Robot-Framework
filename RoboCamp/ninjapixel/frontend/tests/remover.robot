*** Settings ***
Documentation       Exclusão de produtos
...     Sendo um administrador de catálogo que possui produtos indesejados
...     Quero deletar estes produtos
...     Para que eu possa manter o meu catálago atualizado

Resource    ../resources/actions.robot

Suite Setup         Login Session
Suite Teardown      Close Session

Test Teardown       After Test

*** Test Cases ***
Apaga produto
    Dado que eu tenho o produto "mario.json" no catálago
    Quando solicito a exclusão
    E confirmo a solicitação
    Então não devo ver este item no catálogo

Desistir da remoção
    Dado que eu tenho o produto "zelda.json" no catálago
    Quando solicito a exclusão
    Mas cancelo a solicitação
    Então devo ver este item no catálogo