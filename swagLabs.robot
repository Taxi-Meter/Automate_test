*** Settings ***
Library    SeleniumLibrary
Suite Setup    Set Selenium Speed    1s

*** Variables ***
${URL}   https://www.saucedemo.com/ 
${Browser}    chrome
${username}    standard_user
${password}    secret_sauce


*** Keywords ***
openWeb
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --incognito
    ${prefs}    Create Dictionary    profile.password_manager_enabled=${FALSE}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Call Method    ${options}    add_argument    --disable-blink-features\=AutomationControlled
    Open Browser    ${URL}    ${Browser}    options=${options} 

*** Test Cases ***
TC_001
    [Documentation]    Login
    openWeb
    Input Text    //*[@id="user-name"]    ${username}
    Input Text    //*[@id="password"]    ${password}
    Click Button    //*[@id="login-button"]    
    Wait Until Element Is Visible    //*[text()="Products"]

TC_002
    [Documentation]    add two different product
    Click Button    //*[@class="btn btn_primary btn_small btn_inventory "and @name="add-to-cart-sauce-labs-backpack"]
    Click Button    //*[@class="btn btn_primary btn_small btn_inventory "and @name="add-to-cart-sauce-labs-bike-light"]
    Wait Until Element Is Visible    //*[@class="shopping_cart_badge"and text()="2"]

TC_003
    [Documentation]    Review chart
    Click Element     //*[@class="shopping_cart_link"]
    Wait Until Element Is Visible    //*[text()="Sauce Labs Backpack"]
    Wait Until Element Is Visible    //*[text()="Sauce Labs Bike Light"]

TC_004
    [Documentation]    Checkout
    Click Button    //*[@id="checkout"]
    Wait Until Element Is Visible    //*[text()="Checkout: Your Information"]
    Input Text    //*[@id="first-name"]    standard
    Input Text    //*[@id="last-name"]    secret
    Input Text    //*[@id="postal-code"]    12345
    Click Button    //*[@id="continue"]
    Wait Until Element Is Visible    //*[text()="Checkout: Overview"]    

TC_005
    [Documentation]    Verify Pricing
    ${priceOne}    Get Text    //*[@id="item_4_title_link"]//following-sibling::div[2]/div
    ${priceTwo}    Get Text    //*[@id="item_0_title_link"]//following-sibling::div[2]/div
    ${tax}    Set Variable    3.20
    ${total}    Evaluate    ${priceOne}[1:6] + ${priceTwo}[1:6]
    ${totalWithfee}    Evaluate    ${total} + ${tax}
    ${priceTotal}    Get Text    //*[@class="summary_info"]//following-sibling::div[7]
    IF    ${totalWithfee} == ${priceTotal}[8:13]
        Log To Console    Confirm Price
    END
    
TC_006
    [Documentation]    Complete Order
    Click Button    //*[@id="finish"]
    Wait Until Element Is Visible    //*[text()="Checkout: Complete!"]
    ${message}    Get Text    //*[@class="complete-header"]
    IF    "${message}" == "Thank you for your order!"
        Log To Console    Complete
    END

TC_007
    [Documentation]    Logout
    Click Button    //*[@id="react-burger-menu-btn"]
    Click Element    //*[@id="logout_sidebar_link"]
    Wait Until Element Is Visible    //*[@id="login-button"]
    Close Browser
    
    

    




    
