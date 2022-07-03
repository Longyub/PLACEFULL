*** Settings ***
Library    SeleniumLibrary
Library    ${EXEC_DIR}/download.py
Resource   ${EXEC_DIR}/TestSuite/T96909_KW1.robot
Variables  ${EXEC_DIR}/TestSuite/T96909_Data.yaml

Test Setup  auto_download

Test Teardown  Close All Browsers

*** Test Cases ***
T96909 - Double charges occurring for customer bookings
    [Tags]  T96909
   FOR  ${index}  IN RANGE  10
       Get Name Random
       Go to the Store page    ${T96909.STORE_PAGE_URL}
       Click on the Book Now button on Group party
       wait until page contains element  //i[@class='fa fa-spinner fa-spin']  1000s
       wait until page does not contain element  //i[@class='fa fa-spinner fa-spin']  1000s
#       wait until page contains element    //strong[@class='price']    100s
       Verify the Subtotal display on screen    ${T96909.Price}
       Click on the Book Now button
#       Verify the Event Price, Taxes, Subtotal, Total fields on Purchase Details  ${T96909.Price}  ${T96909.Tax}  ${T96909.Subtotal}  ${T96909.Subtotal}
       Input value into Contact Info  ${T96909.First_Name}  ${random_Name} ${random_Name}  ${T96909.Phone}  ${random_Name}${T96909.Email}
       Input value into Additional Info  ${T96909.Child_Name}
       Click on the Add to Cart button

       Click on the Checkout button
       Input value into Billing Name and Address  ${T96909.First_Name}  ${random_Name}    ${T96909.Phone}  ${random_Name}${T96909.Email}    ${T96909.Billing_Address}  ${T96909.Zip_code}  ${T96909.City}  ${T96909.State}
       Input value into Payment Method    ${T96909.Credit_Card_Number}    ${T96909.Security_Code}    ${T96909.Expiration_Month}  ${T96909.Expiration_Year}
       #wait for card timeout
       SLEEP  180s
       Check I agree to the PlaceFull Terms & Conditions - Click on Purchase
       sleep  3s
       #wait for load when clicking on purchase
       wait until page does not contain element    //*[@id="pf-root"]/div/div[10]/div[2]/h3/i    50s
       #Verify the error Alert should be displayed
       wait until page contains element    //*[@id="pf-root"]/div/div[3]/div/div    50s
       Capture Page Screenshot      D:/logs/selenium-screenshot-${index}${random_Name}.png
       sleep  5s
       reload page
       Click on the Book Now button on Group party
       wait until page contains element  //i[@class='fa fa-spinner fa-spin']  500s
       wait until page does not contain element  //i[@class='fa fa-spinner fa-spin']  500s
#       wait until page contains element    //strong[@class='price']    100s
       Verify the Subtotal display on screen    ${T96909.Price}
       Click on the Book Now button
#       Verify the Event Price, Taxes, Subtotal, Total fields on Purchase Details  ${T96909.Price}  ${T96909.Tax}  ${T96909.Subtotal}  ${T96909.Subtotal}
       Input value into Contact Info  ${T96909.First_Name}  ${random_Name} ${random_Name}  ${T96909.Phone}  ${random_Name}${T96909.Email}
       Input value into Additional Info  ${T96909.Child_Name}
       Click on the Add to Cart button
       Click on the Checkout button
       Input value into Billing Name and Address  ${T96909.First_Name}  ${random_Name}    ${T96909.Phone}  ${random_Name}${T96909.Email}    ${T96909.Billing_Address}  ${T96909.Zip_code}  ${T96909.City}  ${T96909.State}
       Input value into Payment Method    ${T96909.Credit_Card_Number}    ${T96909.Security_Code}    ${T96909.Expiration_Month}  ${T96909.Expiration_Year}
       #wait for card timeout
       Check I agree to the PlaceFull Terms & Conditions - Click on Purchase
       wait until page does not contain element    //*[@id="pf-root"]/div/div[10]/div[2]/h3/i    80s
       ${Purchase_status}  Run keyword and return status  Should purchase a booking successfully without error in card  ${T96909.Subtotal}
       Run keyword if  '${Purchase_status}'=='False'  Check I agree to the PlaceFull Terms & Conditions - Click on Purchase
       Close All Browsers
   END


#T96909 - Double charges occurring for customer bookings
#    [Tags]  T96909
#   FOR  ${index}  IN RANGE  5
#       Get Name Random
#       Go to the Store page    ${T96909.STORE_PAGE_URL}
#       Click on the Book Now button on Group party
#       wait until page contains element  //i[@class='fa fa-spinner fa-spin']  500s
#       wait until page does not contain element  //i[@class='fa fa-spinner fa-spin']  500s
##       wait until page contains element    //strong[@class='price']    100s
#       Verify the Subtotal display on screen    ${T96909.Price}
#       Click on the Book Now button
##       Verify the Event Price, Taxes, Subtotal, Total fields on Purchase Details  ${T96909.Price}  ${T96909.Tax}  ${T96909.Subtotal}  ${T96909.Subtotal}
#       Input value into Contact Info  ${T96909.First_Name}  ${random_Name}   ${T96909.Phone}  ${random_Name}${T96909.Email}
#       Input value into Additional Info  ${T96909.Child_Name}
#       Input value into Billing Info  ${T96909.First_Name}  ${random_Name}  ${T96909.Billing_Address}  ${T96909.Zip_code}  ${T96909.City}  ${T96909.State}
#       Input value into Payment Info  ${T96909.Credit_Card_Number}    ${T96909.Security_Code}    ${T96909.Expiration_Month}  ${T96909.Expiration_Year}
#       Check I agree to the PlaceFull Terms & Conditions
#       Click on the Purchase button
#       wait until page does not contain element  //i[@class='fa fa-spinner fa-spin']  1000s
#       ${Purchase_status}  Run keyword and return status  Should purchase a booking successfully without error  ${T96909.Subtotal}
#       Run keyword if  '${Purchase_status}'=='False'  Retry - Click on the Purchase button
#       Close All Browsers
#   END

#T96909_1 - Your page - Double charges occurring for customer bookings
#    [Tags]  T96909_1
#    FOR  ${index}  IN RANGE  10
#       Get Name Random
#       Go to the Store page    ${T96909_1.STORE_PAGE_URL}
#       Your page - Click on the Book Now button on Group party
#       wait until page contains element  //i[@class='fa fa-spinner fa-spin']  250s
#       wait until page does not contain element  //i[@class='fa fa-spinner fa-spin']  250s
##       wait until page contains element    //strong[@class='price']    100s
#       Verify the Subtotal display on screen    ${T96909_1.Price}
#       Click on the Book Now button
##       Verify the Event Price, Taxes, Subtotal, Total fields on Purchase Details  ${T96909.Price}  ${T96909.Tax}  ${T96909.Subtotal}  ${T96909.Subtotal}
#       Input value into Contact Info  ${T96909_1.First_Name}  ${T96909_1.Last_Name}${random_Name}  ${T96909_1.Phone}  ${random_Name}${T96909_1.Email}
#       Input value into Additional Info  ${T96909_1.Child_Name}
#       Input value into Billing Info  ${T96909_1.First_Name}  ${T96909_1.Last_Name}${random_Name}  ${T96909_1.Billing_Address}  ${T96909_1.Zip_code}  ${T96909_1.City}  ${T96909_1.State}
#       Input value into Payment Info  ${T96909_1.Credit_Card_Number}    ${T96909_1.Security_Code}    ${T96909_1.Expiration_Month}  ${T96909_1.Expiration_Year}
#       your page - Check I agree to the PlaceFull Terms & Conditions
#       Your page - Click on the Purchase button
#       wait until page does not contain element  //i[@class='fa fa-spinner fa-spin']  125s
#       ${Purchase_status}  Run keyword and return status  Should purchase a booking successfully without error  ${T96909_1.Subtotal}
#       Run keyword if  '${Purchase_status}'=='False'  Retry - Your page - Click on the Purchase button
#       Close All Browsers
#    END








