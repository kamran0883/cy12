let locators = {}
let dataFile = {}

const step5_1locatorsFilePath = "cypress/pages/CustomerDetails/LicenseDetailsStep5_1-locators.json"
const step5_1DataFilePath = "cypress/fixtures/CustomerDetails/LicenseDetailsStep5_1.json"

class LicenseDetailsStep5_1 {

    /**
     * this method reads data files for Quotation Comparison Step3.4 Trade-in Details
     */
    readData() {
        cy.readFile(step5_1locatorsFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(step5_1DataFilePath).then((obj) => {
            dataFile = obj
        })
    }

    /**
     * this method will click on specified element
     * @param {string} btnKey key to pass locator 
     */
    buttonClick(btnKey) {
        cy.get(locators[btnKey], { timeout: dataFile.maxWaitTime }).click();
    }


    /**
     * this method will assert element visibility
     * @param {string} locatorKey key to pass locator
     */
    assertElementVisible(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile.maxWaitTime }).should('be.visible')
    }

    /**
     * this method will input license info on license details page
     * @param {string} locatorKey key to pass locator 
     * @param {string} dataValue key to pass input value
     */
    inputLicenseDetails(dataValue, locatorKey) {
        cy.get(locators[locatorKey]).clear().type(dataFile[dataValue])
    }

    /**
    * this method will upload Proof of Insurance image
    */
    uploadLicenseImage(imageFilePath, locatorKey) {
        cy.get(locators[locatorKey]).selectFile(dataFile[imageFilePath])
    }

    /**
     * this method will assert license verificaton API response
     */
    assertLicenseInformation() {
        cy.intercept(Cypress.env('LICENSE_VERIFICATION_URL')).as("licenseVerification")
        cy.wait("@licenseVerification", { timeout: dataFile.maxWaitTime }).should(licenseVerification => {
            expect(licenseVerification.response.statusCode).to.eq(200)
        })
    }

    /**
     * this method will verify license info loaded on license-verifcation API call
     * @param {string} locatorKey key to pass locator 
     * @param {string} valueKey value to be verified
     */
    verifyLicenseInfo(locatorKey, valueKey) {
        cy.get(locators[locatorKey]).should('have.value', dataFile[valueKey])
    }

    /**
     * this method will select specified item from dropdown list
     * @param {string} parent key to pass locator of parent element
     * @param {string} listLocator key to pass locator of dropdown list
     * @param {string} listValue value to be selected from dropdown
     */
    selectFromDropDownList(listValue, listLocator, parent) {
        cy.get(locators[parent]).parent().click()
        cy.get(locators[listLocator]).find('li').contains(dataFile[listValue]).scrollIntoView().click()
    }

    /**
     * this method will assert if DOB is not greater than or equal to current date
     */
    dateOfBirthAndCurrentDateComparison() {
        const currentDate = new Date()
        expect(dataFile.dateofBirth >= currentDate == false,
            `Asserting DOB should not be greater than or equal to Current Date`
        ).to.be.true
    }

    /**
     * this method will verify the licenseExpiry date is greater than the current date
     */
    licenceExpiryDateAndCurrentDateComparison() {
        const currentDate = new Date()
        expect(dataFile.licenseExpirationDate <= currentDate == false,
            `Asserting License Expiry Date should always be greater than Current Date`
        ).to.be.true
    }

} export const licenseDetails = new LicenseDetailsStep5_1()
