Feature: Euregio Acadmey Login flow to Lane

Scenario: Login to The Euregio Acadmy
    Given User will go to Euergo Academy Home Page
    When User will click on Sign in button
    And User will click Log in with Email 
    And User will enter user name
    And User will enter password
    Then User will click on Log in button


Scenario: Euregio Academy Sign up with Email Verification

    Given User will click on Sign up button
    When User will enter "Kamran" first name
    And User will enter "Yousaf" last name
    And User will enter email address
    And User will enter "Hitech" company name
    And User will enter "K@mran1985" password
    And User will enter "K@mran1985" confirm password
    And User will mark I agree to receive Euregio Academy the Terms & Conditiontions
    And User will mark I agree to receive Euregio Academy the newsletter
    Then User will click on Sign up button