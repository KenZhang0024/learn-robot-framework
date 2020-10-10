*** Settings ***
Documentation  This is some basic info about the test suite
Library  SeleniumLibrary

*** Variables ***
${product_name}=  Ferrari 458

*** Test Cases ***
User must to sign in to check out
    [Documentation]  Only allow signned in user to check out
    [Tags]  Smoke
    Open Browser  http://www.amazon.com  chrome

    Wait Until Page Contains Element  xpath=//input[@id="twotabsearchtextbox"]
    Input Text  id=twotabsearchtextbox  ${product_name}
    Click Button  xpath=//span[@id="nav-search-submit-text"]//input

    Wait Until Page Contains  results for "${product_name}"
    Click Link    xpath=//div[contains(@data-component-type, "s-search-result")][1]//a

    Wait Until Page Contains Element  xpath=//a[@id="buybox-see-all-buying-choices-announce"]
    Click Link  xpath=//a[@id="buybox-see-all-buying-choices-announce"]

    Wait Until Page Contains Element  xpath=//input[contains(@name, "submit.addToCart")]
    Click Button  xpath=//input[contains(@name, "submit.addToCart")][1]

    Wait Until Page Contains Element  xpath=//a[@id="hlb-ptc-btn-native"]
    Click Link  xpath=//a[@id="hlb-ptc-btn-native"]

    Page Should Contain Element  xpath=//div[@id="authportal-main-section"]
    Element Should Contain  xpath=//div[@id="authportal-main-section"]  Sign-In

    Close Browser

*** Keywords ***
