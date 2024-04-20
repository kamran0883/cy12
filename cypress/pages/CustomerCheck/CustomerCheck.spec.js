let locators = {}
let dataFile = {}
const locatorFilepath = "cypress/pages/CustomerCheck/CustomerCheck-locators.json";
const orderDataFilePath = "cypress/fixtures/CustomerCheck/CustomerCheck.json"

class CustomerCheck {

    /*
     *this method will read locators file and data file for create Order jouney
    */
    readDataFile() {
        cy.readFile(locatorFilepath).then((obj) => {
            locators = obj
        })
        cy.readFile(orderDataFilePath).then((obj) => {
            dataFile = obj
        })
    }

    /*
     *this method will check Create New Order button to be enabled 
     *and then click Create New Order button 
    */
    validateOrderButton() {
        cy.get(locators.createOrderBtn, { timeout: dataFile.orderBtnWait }).should('be.enabled').click()
    }

    /*
     * this method will intercept checkCustomerByEmail API
     * and will validate email input field and enter customer's email
    */
    emailInput(email) {
        cy.intercept(Cypress.env("DMS_API_BASE_URL") + "/dms/check-customer-by-email").as("checkCustomerByEmail")
        cy.get(locators.customerEmailField).should('be.visible').type(email).blur()
    }

    /**
     * this method will generate random email
     * and will input random email for new customer
     * and will existing email for existing customer
     * @param {string} emailFlag flag for new or existing customer email
    */
    customerInfo(emailFlag) {
        cy.readFile(orderDataFilePath).then((file) => {
            cy.createRandomEmail(10).then((emailObj) => {
                const email = emailFlag === 'new' ? emailObj : dataFile.existingCustomerEmail;
                this.emailInput(email)
                file["newCustomerEmail"] = emailObj
            })
            cy.writeFile(orderDataFilePath, file)
        })
    }

    /*
     * this method will wait for customerCheckByEmail api
     * to validate customer email
     * @param {string} checkFlag flag for consent checkbox is aut-checked or not
    */
    checkCustomerStatus(checkFlag) {
        cy.wait("@checkCustomerByEmail", { timeout: dataFile.customerCheckWait })
            .should(call => {
                expect(call.response.statusCode).eq(200);
            })
        if (checkFlag === 'not') {
            cy.get(locators.checkBoxChanged).should('not.exist')
        } else {
            cy.get(locators.checkBoxChanged).should('exist')
        }

    }
}
export default CustomerCheck