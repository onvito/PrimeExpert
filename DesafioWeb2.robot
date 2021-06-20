*** Settings ***
Library   SeleniumLibrary
Library   String

*** Variable ***
${URL}            http://automationpractice.com/
${BROWSER}        chrome
${CATEGORIES}     "Women"
${SUB_CATEGORY}   "Summer Dresses"
*** Keywords ***

Abrir o navegador
  Open Browser    about:blank    ${BROWSER}

Acessar a página inicial do site
  Go To     ${URL}
  Sleep     10
  Title Should Be   My Store
  
Passar o mouse por cima da categoria "${CATEGORIES}" no menu principal superior de categorias
  Mouse Over      xpath=//*[@id="block_top_menu"]/ul/li[1]/a[@class="sf-with-ul"]

Clicar na sub categoria "${SUB_CATEGORY}"
  Wait Until Element Contains   xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a   ${SUB_CATEGORY}
  Click Link    xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

