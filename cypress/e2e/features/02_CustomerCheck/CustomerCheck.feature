Feature: Order Creation In Dealer Portal - Customer Check

    Background: Lender Profile should be available on Lane
        Given I read data file for Lane Login
        When I login to MarketPlace and save session
        And I read data file for Create Order on Lane

    @lane-sanity @lane-regression
    Scenario: The Consent checkbox should not be auto-checked when adding a new email
        Given I click on 'Create New Order' button
        When I enter a 'new' email address
        Then I verify Consent Checkbox should 'not' auto-checked

    @lane-sanity @lane-regression
    Scenario: The Consent Checkbox should be auto-checked when adding an existing email
        Given I click on 'Create New Order' button
        When I enter a 'existing' email address
        Then I verify Consent Checkbox should 'be' auto-checked