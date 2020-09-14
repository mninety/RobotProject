*** Settings ***
Library    String
Library    SeleniumLibrary    
Library    SikuliLibrary
Suite Setup    Set Global Variable    ${webpanel}    https://qa2.gim.com.bd/application/#/
*** Variables ***
${browser}        Chrome    #Chrome    #headlesschrome
${adddriver}    enterprise-partner/drivers/search

*** Test Cases ***
Partner Login
        
    #Log To Console    RandomNumber=${numbers}
    Open Browser    ${webpanel}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Input Text    xpath=//input[@formcontrolname='phone']    01150505025
    Input Text    xpath=//*[@id="navbarResponsive"]/div[2]/form/div[2]/input    123456
    Click Button    xpath=//*[@id="navbarResponsive"]/div[2]/form/button    
    Sleep    5s       
    
Add Driver
    Go To     ${webpanel}${adddriver}
    Set Browser Implicit Wait    5    
    ${NewPartner}    Generate random string    8    0123456789
    #Log To Console    RandomNumber=${NewPartner}
    Input Text    name=mobileQuery    011${NewPartner}  
    Click Button    xpath=//div[@class='form']/button    
    Click Button    xpath=//*[@id="body"]/app-root/app-enterprise-partner-layout/div/app-partner-driver-search/div/div/div[2]/section/div[2]/button    
    Input Text    id=name    Driver Test    
    Input Text    xpath=//input[@formcontrolname='dob']    02/02/2002
    Input Text    xpath=//input[@role='combobox']    dhaka    
    Click Element    xpath=//div[@role='option']
    ${License}    Generate random string    10    0123456789
    Input Text    xpath=//input[@formcontrolname='driverLicenseNumber']     ${License}     
    Input Text    xpath=//input[@formcontrolname='driverLicenseExpiryDate']    02/02/2022
    Click Element    id=agree    
    Click Button    xpath=//div[@class='form-group']/div/button      
    
    #Choose File    xpath=//div[@class='form-group']/div/button    D:\\AutomationImage.JPG  
    #Close Browser
    #Sleep    5s    