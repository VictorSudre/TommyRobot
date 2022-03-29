*** Settings ***
Library     SeleniumLibrary
*** Variables ***
${url}                        https://br.tommy.com/
${fecharCaixaNews}            class:close-news
${campoDeBusca}               id:searchtyped
${ordenar}                    xpath://*[@id="cool-select"]/p
${menorPreço}                 xpath://*[@id="cool-select"]/div/p[1]
${produtoSelecionado}         xpath://*[@id="2778"]
${tamanho}                    xpath://*[@id="content"]/div[2]/div[2]/div[5]/div/ul/li[2]/span/label[2]
${botaoAdicionar}             css:div[class="btnComprar"]
${sacola}                     css:div[class="customMiniCart"]
${finalizarCompra}            xpath://*[@id="product-page"]/header/div[2]/div[4]/div[4]/div/div/div[2]/div/div[3]/a[2]
*** Keywords
iniciar 
    Open Browser                    ${url}     chrome
fechar 
    #Capture Page Screenshot
    Close Browser
#### keywords funcionais
acessar
    Go to                    ${url}
    Sleep                    2
    Click Element            ${fecharCaixaNews}
    Sleep                    2
realizarLogin
    Click Element       id:login
    Sleep               3
    Click Element       xpath://*[@id="loginWithUserAndPasswordBtn"]
    Sleep               3
    Input Text          id:inputEmail   #inserir email
    input Text          id:inputPassword                  #inserir Senha
    Sleep               2
    Click Element       xpath://*[@id="classicLoginBtn"]
    Sleep               3
pesquisarProduto
    Input Text               ${campoDeBusca}     Jaqueta
    Press Keys               ${campoDeBusca}     ENTER
ordenar
    Click Element            ${ordenar}
    Sleep                    2
    Click Element            ${menorPreço}
    Sleep                    2
escolherProduto
    Click Element            ${produtoSelecionado}
    Sleep                    3
    Click Element            ${tamanho}
    Sleep                    2
adicionarProdutoNaSacola
    Click Element            ${botaoAdicionar}
    Sleep                    2
validarProdutoNaSacola      
    Element Should Contain   ${sacola}       JAQUETA CORTA-VENTO GOLA ALTA
 
finalizarCompra
    Click Element            ${finalizarCompra}
    Sleep                    3
validarTelaDeFinalização
    Page Should Contain                      Finalizar compra