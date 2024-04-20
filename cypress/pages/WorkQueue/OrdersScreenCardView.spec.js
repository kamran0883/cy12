let locators = {}
let datafile = {}
const locatorsFilePath = "cypress/pages/WorkQueue/OrdersScreenCardView-locators.json"
const dataFilePath = "cypress/fixtures/WorkQueue/OrdersScreenCardView.json"

class CardView {

    /**
     * this method reads Data and Locator files for User Profile
     */
    readLocatorAndDataFile = () => {
        cy.readFile(locatorsFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(dataFilePath).then((obj) => {
            datafile = obj
        })
    }

    /**
     * this method clicks on the specified element
     * @param {string} locatorKey key to pass locator 
     */
    buttonClick = (locatorKey) => {
        cy.get(locators[locatorKey]).click()
    }

    /**
     * this method will verify the specifed element's text
     * @param {string} locatorKey key to pass locator 
     * @param {string} dataValue key to pas value to be asserted
     */
    assertElementText = (locatorKey, dataValue) => {
        cy.get(locators[locatorKey]).should('have.text', datafile[dataValue])
    }

    /**
     * this method asserts element's visibility
     * @param {string} locatorKey key attribute to pass locator
     */
    assertElementVisible = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: datafile.minWaitTime }).should('be.visible')
    }

    /**
     * this method will perform the double click action on specified element
     * @param {string} locatorKey key to pass locator
     */
    doubleClick = (locatorKey) => {
        cy.get(locators[locatorKey]).dblclick()
    }

    /**
     * this method will perform Mouse over event
     * @param {string} locatorKey key attribute to pass locator
     */
    mouseOverEvent(locatorKey) {
        cy.get(locators[locatorKey], { timeout: datafile.midWaitTime }).realHover()
    }

    /**
     * this method will verify ellipsis menu options on Card View
     * @param {string} dataValue key to pass values to be asserted
     */
    verifyEllipsiMenuOptions = (dataValue) => {
        cy.get(locators.cardEllpisMenuOptions).find('li').contains(datafile[dataValue])
    }

    /**
     * this method will select specified option from ellipsis menu options
     * @param {string} dataValue key to pass options value to be selected
     */
    selectFromEllipisiMenuOptions = (dataValue, locatorKey) => {
        cy.get(locators[locatorKey]).find('li').contains(datafile[dataValue]).click()
    }

} export const cardView = new CardView()