let locators = {}
let dataFile = {}
const locatorFilePath = "cypress/pages/CustomerDetails/EmploymentDetailsStep5_2-locators.json"
const dataFilePath = "cypress/fixtures/CustomerDetails/EmploymentDetailsStep5_2.json"

class EmploymentDetails {

    /**
    * this method reads data and locator files for Quotation To Application
    */
    readDataAndLocatorFiles() {
        cy.readFile(locatorFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(dataFilePath).then((obj) => {
            dataFile = obj
        })
    }

    /**
     * this will click on specified button
     * @param {string} locatorKey key to pass locator
     */
    buttonClick(locatorKey) {
        cy.get(locators[locatorKey]).should('be.visible').click()
    }

    /**
    * this method asserts element's visibility
    * @param {string} locatorKey key attribute to pass locator
    */
    assertElementVisible(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile[4].minWaitTime }).should('be.visible')
    }

    /**
     * this method will select specified item from dropdown list
     * @param {string} parent key to pass locator of parent element
     * @param {string} listLocator key to pass locator of dropdown list
     * @param {string} listValue value to be selected from dropdown
     */
    selectFromDropDownList(listValue, listLocator, parent, index) {
        cy.get(locators[parent]).click()
        cy.get(locators[listLocator]).find('li').contains(dataFile[index][listValue]).scrollIntoView().click()
    }

    /**
    * this method will input customer details in specified input feild
    * @param {string} locatorKey key to pass locator
    * @param {string} dataValue key to pass data value
    */
    inputEmploymentInfo(dataValue, locatorKey, index) {
        if (locatorKey == 'employedSince') {
            cy.get(locators[locatorKey]).clear().type(dataFile[index][dataValue]).blur()
        }
        else
            cy.get(locators[locatorKey]).clear().type(dataFile[index][dataValue])
    }

    /**
     * this method will verify the text of specified element
     * @param {string} locatorAndDataKey key to pass locator and data value
     */
    verifyElementText(locatorAndDataKey, index) {
        cy.get(locators[locatorAndDataKey]).should('have.text', dataFile[index][locatorAndDataKey])
    }

    /**
     * this method returns duration of employment based on move-in Date
     * @returns duration of employment based on years and months
     */
    calculateEmploymentDuration = () => {
        const [month, year] = dataFile[0].employedSince.split('/');
        const employedDateObject = new Date(parseInt(year), parseInt(month) - 1);
        const currentDate = new Date();
        const totalMonths = (currentDate.getFullYear() - employedDateObject.getFullYear()) * 12 +
            currentDate.getMonth() - employedDateObject.getMonth();
        const years = Math.floor(totalMonths / 12).toString().padStart(2, '0');
        const months = (totalMonths % 12).toString().padStart(2, '0');

        return `Duration: ${years} year(s), ${months} month(s)`;
    }

    /**
     * this method will verify duration of employment
     * calculated using calculateEmploymentDuration method
     */
    verifyEmploymentDuration = () => {
        const durationOfEmployment = this.calculateEmploymentDuration()
        cy.get(locators.duration).should('have.text', durationOfEmployment)
    }

} export const employmentDetails = new EmploymentDetails()