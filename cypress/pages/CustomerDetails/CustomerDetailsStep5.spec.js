let locators = {}
let dataFile = {}
let configFile = {}
const locatorsFilePath = "cypress/pages/CustomerDetails/CustomerDetailsStep5-locators.json";
const dataFilePath = "cypress/fixtures/CustomerDetails/CustomerDetailsStep5.json";
const customerCheckDataFilepath = "cypress/fixtures/CustomerCheck/CustomerCheck.json"
const configFilePath = "cypress/fixtures/Configurations/LenderConfigurations.json";

class CustomerDetails {

    /**
    * this method reads data and locator files for Quotation To Application
    */
    readDataAndLocatorFiles() {
        cy.readFile(locatorsFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(dataFilePath).then((obj) => {
            dataFile = obj
        })
        cy.readFile(configFilePath).then((obj) => {
            configFile = obj
        })
    }

    /**
     * this method asserts element's visibility
     * @param {string} locatorKey key attribute to pass locator
     */
    assertElementVisible(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile.maxWaitTime }).should('be.visible')
    }

    /**
     * this method will verify the optional feilds on Contact Details screen
     * @param {string} sibling key to pass sibling element locator
     * @param {string} parent key to pass parent element locator
     * @param {string} dataValue key to pass data value
     */
    assertOptionalFeilds(sibling, parent, dataValue) {
        cy.get(`${locators[parent] + locators[sibling]}`).contains(dataFile[dataValue])
    }

    /**
     * this method will assert the disabled elements
     * @param {string} locatorKey key to pass locator
     */
    verifyDisabledElements(locatorKey) {
        cy.get(locators[locatorKey]).should('be.disabled')
    }

    /**
     * this method will assert emailAddress on Contact Details screen
     * @param {string} locatorKey key to pass locator
     */
    verifyContactEmailAddress(locatorKey) {
        cy.readFile(customerCheckDataFilepath).then((fileData) => {
            cy.get(locators[locatorKey]).should('have.value', fileData.newCustomerEmail)

        })
    }

    /**
     * this method will verify the pre-populated customer info
     * @param {string} locatorKey key to pass locator
     * @param {string} dataValue key to pass data value
     */
    verifyPrepopulatedContactInfo(locatorKey, dataValue) {
        cy.get(locators[locatorKey]).should('contain.value', dataFile[dataValue])
    }

    /**
     * this month returns duration of stay based on move-in Date
     * @returns duration of stay based on years and months
     */
    calculateDurationOfStay = () => {
        const month = dataFile.moveInDate.substring(0, 2);
        const year = dataFile.moveInDate.substring(2);
        const moveInDateObject = new Date(parseInt(year), parseInt(month) - 1);
        const currentDate = new Date();

        const totalMonths = (currentDate.getFullYear() - moveInDateObject.getFullYear()) * 12 +
            currentDate.getMonth() - moveInDateObject.getMonth();

        const years = Math.floor(totalMonths / 12);
        const months = totalMonths % 12;
        return `Duration: ${years} year(s), ${months} month(s)`;
    }

    /**
     * this method will verify duration of stay
     * calculated using calculateDurationOfStay method
     */
    verifyDurationOfStay = () => {
        const durationOfStay = this.calculateDurationOfStay()
        cy.get(locators.duration).should('have.text', durationOfStay)
    }

    /**
     * this method generate random Social Security Number always starting with 4
     */
    generateRandomSSN() {
        cy.readFile(dataFilePath).then((file) => {
            let number = '4';
            for (let i = 1; i < 9; i++) {
                const digit = Math.floor(Math.random() * 9) + 1
                number += digit.toString()
                file["socialSecurityNumber"] = `${number}`
                cy.writeFile(dataFilePath, file)
            }
        })
    }

    /**
     * this method will input customer details in specified input feild
     * @param {string} locatorKey key to pass locator
     * @param {string} dataValue key to pass data value
     */
    inputCustomerDetails(dataValue, locatorKey) {
        if (locatorKey == 'moveInDate') {
            cy.readFile(dataFilePath).then((obj) => {
                cy.get(locators[locatorKey]).clear().type(obj[dataValue]).blur()
            })
        }
        else
            cy.readFile(dataFilePath).then((obj => {
                cy.get(locators[locatorKey]).clear().type(obj[dataValue])
            }))
    }

    /**
     * this method will select specified item from dropdown list
     * @param {string} parent key to pass locator of parent element
     * @param {string} listLocator key to pass locator of dropdown list
     * @param {string} listValue value to be selected from dropdown
     */
    selectFromDropDownList(listValue, listLocator, parent) {
        cy.get(locators[parent]).click()
        cy.get(locators[listLocator]).find('li').contains(dataFile[listValue]).scrollIntoView().click()
    }

    /**
     * this will click on specified button
     * @param {string} locatorKey key to pass locator
     */
    buttonClick(locatorKey) {
        cy.get(locators[locatorKey]).should('be.visible').click()
    }


    /**
     * this method will verify the text of specified element
     * @param {string} locatorAndDataKey key to pass locator and data value
     */
    verifyElementText(locatorAndDataKey) {
        cy.get(locators[locatorAndDataKey]).should('have.text', dataFile[locatorAndDataKey])
    }

    /**
     * this method will check the garaging address checkbox
     */
    checkGaragingAddressCheckbox() {
        cy.get(locators.garagingAddressCheckbox).check()
    }

    /**
    * this method reads applicationExpiryDays from config file, add quote expiry days to current date
    * and write the new date to data file as specified key
    * @param {string} key key attribute specify object name 
    */
    calculateQuoteExpiryDate(key) {
        cy.readFile(dataFilePath).then((file) => {
            const expiryDays = configFile.dealerProfile.prefrences.applicationExpiryDays
            const currentDate = new Date()
            currentDate.setDate(currentDate.getDate() + expiryDays)
            const month = (currentDate.getMonth() + 1).toString().padStart("2", "0");
            const day = currentDate.getDate().toString().padStart("2", "0");
            const year = currentDate.getFullYear();
            file[key] = `Expires on ${month + '/' + day + '/' + year}`
            cy.writeFile(dataFilePath, file)
        })
    }

    /**
     * this method will get applicationExpiryDate from Data File and 
     * assert this date on Customer Details Screen
     */
    verifyApplicationExpiryDate() {
        this.calculateQuoteExpiryDate("applicationExpiryDate")
        cy.readFile(dataFilePath).then((file) => {
            cy.get(locators.applicationExpiryDate).should('have.text', file.applicationExpiryDate)
        })
    }

    /**
     * this method will get the program type selected and save it in data File
     */
    getProgramType = () => {
        cy.readFile(dataFilePath).then((file) => {
            cy.get(locators.programTypeOnHeader, { timeout: dataFile.minWaitTime }).should('be.visible')
            cy.get(locators.programTypeOnHeader, { timeout: dataFile.minWaitTime }).invoke("text").then((obj) => {
                file["programType"] = obj
            })
            cy.writeFile(dataFilePath, file)
        })
    }

} export const customerDetails = new CustomerDetails()