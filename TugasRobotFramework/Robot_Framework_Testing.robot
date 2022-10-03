*** Settings ***
Library           Selenium2Library

*** Variables ***
${F_Name}         Anton1
${L_Name}         yolo1
${URL_Register}    https://demowebshop.tricentis.com/register
${Browser}        firefox
${F_Gender}       F
${M_Gender}       M
${Email}          tryingtesttohard1@gmail.com
${Password}       Teuing123
${ConfirmPassword}    Teuing123
${URL_Login}      https://demowebshop.tricentis.com/login
${Main_Url}       https://demowebshop.tricentis.com/

*** Test Cases ***
TC_Register
    [Documentation]    Register with valid data user
    Open Browser    ${URL_Register}    ${Browser}
    sleep    2
    Select Radio Button    Gender    ${M_Gender}
    sleep    2
    Input Text    id=FirstName    ${F_Name}
    sleep    2
    Input Text    id=LastName    ${L_Name}
    sleep    2
    Input Text    id=Email    ${Email}
    sleep    2
    Input Text    id=Password    ${Password}
    sleep    2
    Input Text    id=ConfirmPassword    ${ConfirmPassword}
    sleep    2
    Click element    id=register-button
    sleep    3
    Get Text    //div[@class='result']/text()/parent::node()
    Close Browser

TC_LOGIN
    [Documentation]    Login with Registered User
    Open Browser    ${URL_Login}    ${Browser}
    sleep    2
    Input Text    id=Email    ${Email}
    sleep    2
    Input Text    id=Password    ${Password}
    sleep    2
    Click element    //*[@class="button-1 login-button"]
    sleep    2
    Get text    //*[@class="topic-html-content-header"]
    sleep    2
    Close Browser

TC_Add Book Product To Cart
    Open Browser    ${Main_Url}    ${Browser}
    Click Element    //*[@href="/books"]/parent::node()
    Click Element    //*[@id="products-orderby"]
    Click Element    //*[@id="products-pagesize"]
    Click Element    //*[@id="products-viewmode"]/option[1]
    Click Element    //*/input[@onclick="AjaxCart.addproducttocart_catalog('/addproducttocart/catalog/13/1/1 \ \ \ ');return false;"]
    Get text    //*[@id="bar-notification"]
    Close Browser
