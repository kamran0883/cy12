let locators = {}
let dataFile = {}
const locatorsFilePath = "cypress/pages/OrderSummary/PaymentIndicatorAndDocuments-locators.json";
const dataFilePath = "cypress/fixtures/OrderSummary/PaymentIndicatorAndDocuments.json"

class PaymentIndicatorAndDocument {

    /**
     * this method reads data and locator files for Payment Indicator and Documents
     */
    readLocatorsAndDataFiles = () => {
        cy.readFile(locatorsFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(dataFilePath).then((obj) => {
            dataFile = obj
        })
    }

    /**
     * this method will assert the element's visibility
     * @param {string} locatorKey key to pass locator 
     */
    assertElementVisibility = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('be.visible')
    }

    /**
     * this method will click on the specified element
     */
    buttonClick = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).click()
    }

    /**
     * this method will assert payment received checkbox state
     * @param {string} checkFlag key to assert checkbox state
     */
    verifyPaymentCheckBoxUnchecked = (checkFlag) => {
        if (checkFlag == 'not') {
            cy.get(locators.paymentCheckboxChanged).should('not.exist')
        } else {
            cy.get(locators.paymentCheckboxChanged).should('exist')
        }
    }

    /**
     * this method will verify the element is enabled or disabled based of the key provided
     * @param {string} locatorKey key to pass locator
     * @param {string} keyFlag key to assert element is enabled or disabled
     */
    assertElementEnabled = (locatorKey, keyFlag) => {
        if (keyFlag = 'enabled') {
            cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('be.enabled')
        }
        else { cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('not.be.enabled') }
    }

    /**
     * this method will verify the green tick for each document
     */
    verifySignatureMark = () => {
        cy.get(".MuiDialog-container > .MuiPaper-elevation", { timeout: dataFile.minWaitTime }).should('not.exist')
        cy.get(".MuiBox-root > .Mui-disabled", { timeout: dataFile.minWaitTime }).should('not.exist')
    }



} export const paymentIndicator = new PaymentIndicatorAndDocument()