*** Settings ***
Documentation   Aqui está sendo feito o desafio 2 passado em sala de Mobile Automation.

Library         AppiumLibrary
Library         SeleniumLibrary


*** Keywords ***
Abrir o aplicativo
  Open Application                http://localhost:4723/wd/hub
  ...                             automationName=UiAutomator2
  ...                             platformName=Android
  ...                             deviceName=emulator-5554
  ...                             autoGrantPermissions=true
  ...                             appPackage=com.google.android.youtube
  ...                             appActivity=com.google.android.youtube.HomeActivity

Entrar no menu “${EXPLORER}”
  Click Element                   accesibility_id=Explorar
  Element Should Be Visible       xpath=//*[@id="app"]/div[1]/ytm-browse/ytm-single-column-browse-results-renderer/div/div/ytm-section-list-renderer/ytm-channel-list-sub-menu-renderer/div

Usar swipe de tela até o 10 item da tela
  FOR   ${VAR}    IN     RANGER   0   10
    Swipe   533   495   533    100
    ${VAR}=   Set Variable    ${VAR}+1  
  END
  Click Element                   xpath=//*[@id="app"]/div[1]/ytm-browse/ytm-single-column-browse-results-renderer/div/div/ytm-section-list-renderer/lazy-list/ytm-item-section-renderer[12]