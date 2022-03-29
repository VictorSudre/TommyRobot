*** Settings ***
Resource        baseT.robot
Test Setup      iniciar  
Test Teardown   fechar  
*** Test Cases ***
Realizar fluxo E2E venda - Tommy - Sem Login
   acessar
   pesquisarProduto
   ordenar
   escolherProduto
   adicionarProdutoNaSacola
   validarProdutoNaSacola
   finalizarCompra
   validarTelaDeFinalização
Realizar fluxo E2E venda - Tommy - com Login
    acessar
    realizarLogin
    pesquisarProduto
    ordenar
    escolherProduto
    adicionarProdutoNaSacola
    validarProdutoNaSacola
    finalizarCompra
