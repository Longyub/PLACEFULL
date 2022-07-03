*** Settings ***
Library    SeleniumLibrary
Library    ${EXEC_DIR}/download.py
Resource    T96909_Locators.robot
Variables    T96909_Data.yaml

Library  Collections
Library  String


*** Keywords ***
Go to the Store page
    [Arguments]   ${URL}
    auto_download
    ${chrome_options} =    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    acceptInsecureCerts
    Create WebDriver    Chrome    chrome_options=${chrome_options}
    Go To    ${URL}
    Maximize Browser Window

Click on the Book Now button on Group party
#    wait until page contains element    //h1[normalize-space()='s']  10s
#    wait until element is visible    //a[@id='details-group-party-button']
    wait until page contains element    //a[@id='details-group-party-button']  20s
    sleep  8s
    click element  //a[@id='details-group-party-button']

Your page - Click on the Book Now button on Group party
    wait until page contains element    //h1[normalize-space()='Double R Sports Complex']  1000s
#    wait until element is visible    //a[@id='details-group-party-button']
    wait until page contains element    //body[1]/div[2]/div[2]/div[1]/div[1]/div[3]/div[1]/div[3]/a[1]  1000s
    sleep  8s
    click element  //body[1]/div[2]/div[2]/div[1]/div[1]/div[3]/div[1]/div[3]/a[1]

Verify the starting from Price displays correctly
    [Arguments]  ${Price}
    wait until page contains element  //div[@class='wrapper']//p[1]//label[1]  200s
    ${Starting_Price}    get text    //strong[@class='price']
    should be equal  ${Price}  ${Starting_Price}

Verify the Subtotal display on screen
    [Arguments]  ${Price}
    scroll element into view  //button[normalize-space()='Book Now']

    press keys    None    ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN
    sleep  5s
    ${Sub_Total}    get text  //h4[normalize-space()='$100']
    should be equal  ${Price}  ${Sub_Total}

Click on the Book Now button
    wait until element is visible    //button[normalize-space()='Book Now']
    click element  //button[normalize-space()='Book Now']

Verify the Event Price, Taxes, Subtotal, Total fields on Purchase Details
    [Arguments]  ${Event_Price}  ${Taxes}  ${Subtotal}  ${Total}
    wait until page contains element  //h2[normalize-space()='Purchase Details']
    ${E_Price}    get text  //span[@data-bind='currencyText: eventPrice']
    ${Tax}    get text  //span[@data-bind='currencyText: taxes']
    ${Sub}    get text  //span[@data-bind='currencyText: subtotal']
    ${TotalP}    get text  //span[@data-bind='currencyText: total']
    should be equal  ${Event_Price}  ${E_Price}
    should be equal  ${Taxes}  ${Tax}
    should be equal  ${Subtotal}  ${Sub}
    should be equal  ${Total}  ${TotalP}

Input value into Contact Info
    [Arguments]  ${First_Name}  ${Last_Name}  ${Phone}  ${Email}
    scroll element into view  //h3[normalize-space()='Contact Info']
    press keys    None    ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN
    wait until element is visible  //input[@id='txtFirstName']
    sleep  500ms
    input text  //input[@id='txtFirstName']  ${First_Name}
    wait until element is visible  //input[@id='txtLastName']
    sleep  500ms
    input text  //input[@id='txtLastName']  ${Last_Name}
    wait until element is visible  //input[@id='txtPhone']
    sleep  500ms
    input text  //input[@id='txtPhone']  ${Phone}
    wait until element is visible  //input[@id='txtEmail']
    sleep  500ms
    input text  //input[@id='txtEmail']  ${Email}

Your page-Input value into Contact Info
    [Arguments]  ${First_Name}  ${Last_Name}  ${Phone}  ${Email}
    scroll element into view  //h3[normalize-space()='Contact Info']
    press keys    None    ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN
    wait until element is visible  //input[@id='txtFirstName']
    sleep  500ms
    input text  //input[@id='txtFirstName']  ${First_Name}
    wait until element is visible  //input[@id='txtLastName']
    sleep  500ms
    input text  //input[@id='txtLastName']  ${Last_Name}
    wait until element is visible  //input[@id='txtPhone']
    sleep  500ms
    input text  //input[@id='txtPhone']  ${Phone}
    wait until element is visible  //input[@id='txtEmail']
    sleep  500ms
    input text  //input[@id='txtEmail']  ${Email}

Input value into Additional Info
    [Arguments]  ${Child_Name}
    wait until element is visible  //input[@title='What is the name of your child?']
    sleep  500ms
    input text  //input[@title='What is the name of your child?']  ${Child_Name}

Click on the Add to Cart button
    wait until element is visible    //*[@id="pf-infoPage"]/div[7]/div/div/a
    click element  //*[@id="pf-infoPage"]/div[7]/div/div/a

Verify the cart info
    [Arguments]  ${Event_Price}
    wait until page contains element  //h3[@data-bind='currencyText: $root.cartTotal']  10s
    sleep  5s
    ${Price}    get text  //h3[@data-bind='currencyText: $root.cartTotal']
    should be equal  ${Event_Price}  ${Price}

Click on the Checkout button
    wait until page does not contain element  //i[@class='fas fa-spinner fa-spin fa-lg']    50s
    wait until element is visible    //*[@id="pf-root"]/div/div[4]/div[2]/a     20s
    click element  //*[@id="pf-root"]/div/div[4]/div[2]/a
    sleep  5s

Verify the Total Purchase in the Payment Information
    [Arguments]  ${Total_Price}
    wait until page contains element  //h2[normalize-space()='Payment Details']  10s
    ${Price}    get text  //span[@data-bind='currencyText: cartTotal']
    should be equal  ${Total_Price}  ${Price}

Input value into Credit Card Number
    [Arguments]  ${Credit_Card_Number}
    wait until element is visible  //input[@id='cardNumber']
    sleep  500ms
    input text  //input[@id='cardNumber']  ${Credit_Card_Number}

Input value into Security Code
    [Arguments]  ${Security_Code}
    wait until element is visible  //input[@id='cardID']
    sleep  500ms
    input text  //input[@id='cardID']  ${Security_Code}

Select Expiration Month and Expiration Year
    [Arguments]  ${Expiration_Month}  ${Expiration_Year}
    wait until element is visible  //select[@data-bind='value: $root.payment().expiryMonth']
    select_from_list_by_index  //select[@data-bind='value: $root.payment().expiryMonth']  ${Expiration_Month}
    sleep  500ms
    wait until element is visible  //select[@data-bind='value: $root.payment().expiryYear']
    select_from_list_by_value  //select[@data-bind='value: $root.payment().expiryYear']  ${Expiration_Year}

Input value into Billing Info
    [Arguments]    ${First_Name}  ${Last_Name}    ${Billing_Address}  ${Zip_code}  ${City}  ${State}
    scroll element into view  //h3[normalize-space()='Billing Info']
    click element  //h3[normalize-space()='Billing Info']
    press keys    None    ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN
    wait until element is visible  //input[@id='cardFirstName']
    sleep  500ms
    input text  //input[@id='cardFirstName']  ${First_Name}
    wait until element is visible  //input[@id='cardLastName']
    sleep  500ms
    input text  //input[@id='cardLastName']  ${Last_Name}

    wait until element is visible  //input[@id='txtAddress']
    sleep  500ms
    input text  //input[@id='txtAddress']  ${Billing_Address}
    wait until element is visible  //input[@id='txtZip']
    sleep  500ms
    input text  //input[@id='txtZip']  ${Zip_code}
    wait until element is visible  //input[@id='txtCity']
    sleep  500ms
    input text  //input[@id='txtCity']  ${City}
    wait until element is visible  //select[@id='lstStates']
    select_from_list_by_value  //select[@id='lstStates']  ${State}
    sleep  500ms

Input value into Payment Info
    [Arguments]    ${Credit_Card_Number}    ${Security_Code}    ${Expiration_Month}  ${Expiration_Year}
    scroll element into view  //h3[normalize-space()='Payment Info']
    click element  //h3[normalize-space()='Billing Info']
    press keys    None    ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN
    wait until element is visible  //input[@id='txtCardNumber']
    sleep  500ms
    input text  //input[@id='txtCardNumber']  ${Credit_Card_Number}
    wait until element is visible  //input[@id='txtCardCcv']
    sleep  500ms
    input text  //input[@id='txtCardCcv']  ${Security_Code}
    wait until element is visible  //select[@id='cardExpMonth']
    select_from_list_by_index  //select[@id='cardExpMonth']  ${Expiration_Month}
    sleep  500ms
    wait until element is visible  //select[@id='cardExpYear']
    select_from_list_by_value  //select[@id='cardExpYear']  ${Expiration_Year}

Input value into Billing Name and Address
    [Arguments]    ${First_Name}  ${Last_Name}    ${Phone}    ${Email}  ${Billing_Address}  ${Zip_code}  ${City}  ${State}
    wait until page contains element  //h3[normalize-space()='Billing Name and Address']  50s
    scroll element into view  //h3[normalize-space()='Billing Name and Address']
#    press keys    None    ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN
    wait until element is visible  //*[@id="cardFirstName"]
    sleep  500ms
    input text  //*[@id="cardFirstName"]  ${First_Name}
    wait until element is visible  //*[@id="cardLastName"]
    sleep  500ms
    input text  //*[@id="cardLastName"]  ${Last_Name}
    wait until element is visible  //*[@id="phone"]
    sleep  500ms
    input text  //*[@id="phone"]  ${Phone}
    wait until element is visible  //*[@id="email"]
    sleep  500ms
    input text  //*[@id="email"]  ${Email}
    wait until element is visible  //*[@id="cardAddress"]
    sleep  500ms
    input text  //*[@id="cardAddress"]  ${Billing_Address}
    wait until element is visible  //*[@id="txtZip"]
    sleep  500ms
    input text  //*[@id="txtZip"]  ${Zip_code}
    wait until element is visible  //*[@id="txtCity"]
    sleep  500ms
    input text  //*[@id="txtCity"]  ${City}
    wait until element is visible  //*[@id="lstStates"]
    select_from_list_by_value  //*[@id="lstStates"]  ${State}
    sleep  500ms

Input value into Payment Method
    [Arguments]    ${Credit_Card_Number}    ${Security_Code}    ${Expiration_Month}  ${Expiration_Year}
    scroll element into view  //*[@id="pf-root"]/div/div[8]/div[1]/h3
    wait until element is visible  //*[@id="cardNumber"]
    sleep  500ms
    input text  //*[@id="cardNumber"]  ${Credit_Card_Number}
    wait until element is visible  //*[@id="cardID"]
    sleep  500ms
    input text  //*[@id="cardID"]  ${Security_Code}
    wait until element is visible  //*[@id="pf-root"]/div/div[8]/div[3]/div[2]/div[1]/select
    select_from_list_by_index  //*[@id="pf-root"]/div/div[8]/div[3]/div[2]/div[1]/select  ${Expiration_Month}
    sleep  500ms
    wait until element is visible  //*[@id="pf-root"]/div/div[8]/div[3]/div[2]/div[2]/select
    select_from_list_by_value  //*[@id="pf-root"]/div/div[8]/div[3]/div[2]/div[2]/select  ${Expiration_Year}

Check I agree to the PlaceFull Terms & Conditions
    scroll element into view    //input[@id='pfAgreeTerms']
    wait until element is visible    //input[@id='pfAgreeTerms']
    click element  //input[@id='pfAgreeTerms']

Check I agree to the PlaceFull Terms & Conditions - Click on Purchase
    scroll element into view   //a[normalize-space()='Purchase']
    wait until element is visible    //input[@id='agreeToPlaceFullTerms']
    click element  //input[@id='agreeToPlaceFullTerms']
    wait until element is visible    //a[normalize-space()='Purchase']
    click element  //a[normalize-space()='Purchase']
    sleep  2s

your page - Check I agree to the PlaceFull Terms & Conditions
    scroll element into view    //input[@id='chkAgreeTerms']
    wait until element is visible    //input[@id='chkAgreeTerms']
    click element  //input[@id='chkAgreeTerms']

Click on the Purchase button
    wait until element is visible    //a[@id='btnPurchase']    50s
    click element  //a[@id='btnPurchase']
    sleep  20s

Your page - Click on the Purchase button
    wait until element is visible    //button[@id='btnPurchase']    50s
    click element  //button[@id='btnPurchase']
    sleep  20s

Retry - Click on the Purchase button
    click element  //h3[normalize-space()='Billing Info']
    press keys    None    ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN
    wait until element is visible  //input[@id='txtCardNumber']

    wait until element is visible    //a[@id='btnPurchase']    50s
    click element  //a[@id='btnPurchase']
    sleep  20s

Retry - Your page - Click on the Purchase button
    click element  //h3[normalize-space()='Billing Info']
    press keys    None    ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN
    wait until element is visible  //input[@id='txtCardNumber']

    wait until element is visible    //a[@id='btnPurchase']    50s
    click element  //button[@id='btnPurchase']
    sleep  20s

Should purchase a booking successfully without error
    [Arguments]  ${Total_Price}
    wait until page contains element  //h2[normalize-space()='Confirmation']  50s
    sleep  500ms
    ${Price}    get text  //span[normalize-space()='$110']
    should be equal  ${Total_Price}  ${Price}

Should purchase a booking successfully without error in card
    [Arguments]  ${Total_Price}
    wait until page contains element  //h1[normalize-space()='Purchase Successful!']  100s
    sleep  500ms
#    ${Price}    get text  //h3[normalize-space()='$110']
#    should be equal  ${Total_Price}  ${Price}

Your page - Should purchase a booking successfully without error
    [Arguments]  ${Total_Price}
    wait until page contains element  //div[@class='modal-body text-center']//div[@id='modalMessage']  50s
    sleep  500ms
    ${Price}    get text  //h2[normalize-space()='$110']
    should be equal  ${Total_Price}  ${Price}

Get Name Random
    ${random_Name} =  Generate Random String  6  [LOWER]
    Set test variable  ${random_Name}

Wait loading icon is not display
    Wait until element does not contain      //i[@class='fa fa-spinner fa-spin']     50s

