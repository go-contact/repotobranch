*** Settings ***
Documentation  Esta suite representa os testes do carrinho do DEMOCENTER para a aplicação web MyStore

Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/MyStoreApp.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d Results Tests/Carrinho.robot
# robot -d Results -i Regression Tests/Carrinho.robot
# export PATH=$PATH:~/drivers

*** Test Cases ***
Usuário não logado pode procurar produtos
    MyStoreApp.Procurar Produtos

Usuário não logado pode visualizar produtos
    MyStoreApp.Procurar Produtos
    MyStoreApp.Selecionar Produto no Resultado da Busca

Usuário não logado pode incluir produtos no carrinho
    MyStoreApp.Procurar Produtos
    MyStoreApp.Selecionar Produto no Resultado da Busca
    MyStoreApp.Adicionar Produto ao Carrinho

Usuário não logado não pode finalizar check out
    [Tags]  Debug
    MyStoreApp.Procurar Produtos
    MyStoreApp.Selecionar Produto no Resultado da Busca
    MyStoreApp.Adicionar Produto ao Carrinho
    MyStoreApp.Fazer Checkout Não Logado

Usuário logado pode fazer check out
    [Tags]  Regression
    MyStoreApp.Procurar Produtos
    MyStoreApp.Selecionar Produto no Resultado da Busca
    MyStoreApp.Adicionar Produto ao Carrinho
    MyStoreApp.Fazer Checkout Logado  ${VALID_USER_AND_PASSWORD}
