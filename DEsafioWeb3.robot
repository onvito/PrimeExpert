*** Settings ***
Library   SeleniumLibrary
Library   String

*** Variable ***
${URL}            http://automationpractice.com/
${BROWSER}        chrome
${FIRSTNAME}      Marcelo
${LASTNAME}       Victor
&{INFO}

...    Pass=marcelo143
...    Str=Rua 7
...    City=Brasilia
...    Post=01001
...    Phone=00101010011

${DOMAIN}           @test.com
*** Keywords ***

Abrir o navegador
  Open Browser    about:blank    ${BROWSER}

Acessar a página inicial do site
  Go To     ${URL}
  Sleep     10
  Title Should Be   My Store

Clicar no botão superior direito “${LOGIN}”
  Click Link    xpath=//*[@id="header"]/div[2]//a[@class="login"]

Inserir um e-mail válido  
  ${EMAIL}=  Generate Random String    5     [LOWER]
  Input Text     id=email_create     ${EMAIL}${DOMAIN}
   
Clicar em "${CREAT_ACCOUNT}" para cadastrar
  Click Button    id=SubmitCreate

Preencher os campos obrigatórios
  Wait Until Element Is Visible     id=customer_firstname
  Input Text       id=customer_firstname    ${FIRSTNAME}
  Input Text       id=customer_lastname     ${LASTNAME}
  Input Password   id=passwd                ${INFO.Pass}
  Input Text       id=firstname             ${FIRSTNAME}
  Input Text       id=lastname              ${LASTNAME}
  Input Text       id=address1              ${INFO.Str}
  Input Text       id=city                  ${INFO.City}
  Sleep            10
  Select From List By Index     id=id_state   9
  Input Text       id=postcode              ${INFO.Post}
  Input Text       id=phone_mobile          ${INFO.Phone}

Clicar em "${REGISTER}" para finalizar o cadastro
  Click Button    id=submitAccount








