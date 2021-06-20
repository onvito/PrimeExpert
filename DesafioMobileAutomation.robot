*** Settings ***
Library         AppiumLibrary
Library         SeleniumLibrary

*** Variable ***
${EMAIL}        onvito462@gmail.com
${PASSWD}       ONvito754

*** Keywords ***
Abrir o aplicativo
  Open Application                http://localhost:4723/wd/hub
  ...                             automationName=UiAutomator2
  ...                             platformName=Android
  ...                             deviceName=emulator-5554
  ...                             autoGrantPermissions=true
  ...                             appPackage=com.google.android.youtube
  ...                             appActivity=com.google.android.youtube.HomeActivity
    

Logar no aplicativo com a conta "${ACCOUNT}"
  Click Button                    xpath=//*[@id="header-bar"]/header/div/ytm-topbar-menu-button-renderer/button
  Wait Until Page Contains        id=simple-menu-header-title
  Click Element                   xpath=//*[@id="menu"]/div/ytm-multi-page-menu-renderer/div/ytm-active-account-header-renderer/div[1]/div/div[1]/c3-icon
  Sleep                           2s 
  Click Link                      xpath=//*[@id="menu"]/div/ytm-multi-page-menu-renderer/div/ytm-multi-page-menu-section-renderer/ytm-compact-link-renderer[1]/a
  Element Should Be Visible       accesibility_id=Google
  Input Text                      id=identifierId       ${EMAIL}
  Click Button                    xpath=//*[@id="identifierNext"]/div/button
  Element Should Be Visible       xpath=//*[@id="view_container"]/div/div/div[1]/div/div[2]/div
  Input Password                  id=password           ${PASSWD}
  Click Button                    xpath=//*[@id="passwordNext"]/div/button

Entrar no menu “${EXPLORER}”
  Click Element                   accesibility_id=Explorar
  Element Should Be Visible       xpath=//*[@id="app"]/div[1]/ytm-browse/ytm-single-column-browse-results-renderer/div/div/ytm-section-list-renderer/ytm-channel-list-sub-menu-renderer/div

Usar swipe de tela até o 10 item da tela
  FOR   ${VAR}    IN    RANGER   0   10
    Swipe   533   495   533    100
    ${VAR}=   Set Variable    ${VAR}+1  
  END
  Click Element                   xpath=//*[@id="app"]/div[1]/ytm-browse/ytm-single-column-browse-results-renderer/div/div/ytm-section-list-renderer/lazy-list/ytm-item-section-renderer[12]
