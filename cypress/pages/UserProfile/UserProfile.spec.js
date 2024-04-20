let locators = {}
let datafile = {}
const locatorsFilePath = "cypress/pages/UserProfile/UserProfile-locators.json"
const dataFilePath = "cypress/fixtures/UserProfile/UserProfile.json"
const loginDataFilePath = "cypress/fixtures/Login/login.json"
class UserProfile {

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
     * this method selects the specified option from dropdown
     * @param {string} optionsValue option value to be selected
     */
    selectFromProfileOptions = (optionsValue) => {
        cy.get(locators.profileOptionsDropDown).contains(datafile[optionsValue]).click()
    }

    /**
     * this method clicks on the specified element
     * @param {string} locatorKey key to pass locator 
     */
    buttonClick = (locatorKey) => {
        cy.get(locators[locatorKey]).click()
    }

    /**
     * this method asserts element's visibility
     * @param {string} locatorKey key attribute to pass locator
     */
    assertElementVisible = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: datafile.midWaitTime }).should('be.visible')
    }

    /**
     * this method will verify specified element's text
     * @param {string} locatorKey key to pass locator 
     * @param {string} textValue tex value to be asserted
     */
    assrtElementText = (locatorKey, textValue) => {
        cy.get(locators[locatorKey]).should('include.text', datafile[textValue])
    }

    /**
     * this method will input the specified value in specified input field
     * @param {string} dataValue value to be input in the specified field 
     * @param {string} locatorKey key to pas locator
     */
    inputIntoInputField = (dataValue, locatorKey) => {
        if (locatorKey == 'currentPasswordInputField')
            cy.readFile(loginDataFilePath).then((obj) => {
                cy.get(locators[locatorKey]).clear().type(obj[dataValue])
            })
        else
            cy.readFile(dataFilePath).then((obj) => {
                cy.get(locators[locatorKey]).clear().type(obj[dataValue])
            })
    }

    /**
     * this method will write the random user name into data file
     * using generatRandomUserName custom command
     */
    writeRandomUserNameIntoDataFile = () => {
        cy.readFile(dataFilePath).then((file) => {
            cy.generatRandomUserName(3).then((obj) => {
                file["firstName"] = `Automation ${obj}`;
                file["lastName"] = `User ${obj}`;
                cy.writeFile(dataFilePath, file)
            })
        })
    }

    /**
     * this method will get user initials based on firstName and lastName
     * of user and save them into data file
     */
    getUserInitials = () => {
        cy.readFile(dataFilePath).then((file) => {
            const firstNameInitial = file.firstName[0]
            const lastNameInitial = file.lastName[0]
            file['userInitials'] = (`${firstNameInitial}${lastNameInitial}`)
            cy.writeFile(dataFilePath, file)
        })
    }

    /**
     * this method will verify the email field is disabled by default
     */
    verifyEmailFieldDisabled = () => {
        cy.get(locators.emailInputField).should('have.attr', 'disabled')
    }

    /**
     * this method will generate random name
     * @param {string} key to pass object name for which this random will be saved to data file
     */
    generateRandomName = (key) => {
        cy.readFile(dataFilePath).then((file) => {
            const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
            let randomName = '';
            for (let i = 0; i < 30; i++) {
                const randomIndex = Math.floor(Math.random() * characters.length);
                randomName += characters.charAt(randomIndex);
            }
            file[key] = `User${randomName}`
            cy.writeFile(dataFilePath, file)
        })
    }

    /**
     * This method will verify preloaded user info on User Profile
     * @param {string} locatorKey key to pass locator 
     * @param {string} dataValue value to be verified
     */
    verifyPreloadedUserInfo = (locatorKey, dataValue) => {
        if (locatorKey == 'emailInputField') {
            cy.readFile(loginDataFilePath).then((email) => {
                cy.get(locators[locatorKey]).should('have.value', email[dataValue])
            })
        }
        else {
            cy.readFile(dataFilePath).then((obj) => {
                cy.get(locators[locatorKey]).should('have.value', obj[dataValue])
            })
        }
    }

    /**
     * This method will generate random password 
     * @param {string} lenght will define the length of random password
     */
    createRandomPassword = (length) => {
        const characters = 'ABCDEFGHIJKLMNOPQRSTabcdefghijklmnopqrst123456789!@#$%';
        let password = '';
        for (let i = 0; i < length; i++) {
            password += characters.charAt(Math.floor(Math.random() * characters.length));
        }
        return `Netsolpk1@${password}`;
    }

    /**
     * this method will write the random password with name
     * specified by key parameter using createRandomPassword method
     * @param {string} key to pass object name 
     */
    saveRandomPasswordInDataFile = (key) => {
        cy.readFile(loginDataFilePath).then((file) => {
            file[key] = this.createRandomPassword(5)
            cy.writeFile(loginDataFilePath, file)
        })
    }

    /**
     * this method will input the specified password value in 
     * password field specified by locatorKey 
     * @param {string} dataValue key to pass password object 
     * @param {string} locatorKey key to pass locator
     */
    updatePassword = (dataValue, locatorKey) => {
        cy.readFile(loginDataFilePath).then((file) => {
            cy.get(locators[locatorKey]).clear().type(file[dataValue])
        })
    }

    /**
     * this method will input invalid new password in specified input field
     * @param {string} locatorKey key to pass locator
     */
    inputDifferentNewPassword = (locatorKey) => {
        const diffPassword = this.createRandomPassword(5)
        cy.get(locators[locatorKey]).clear().type(diffPassword)

    }

} export const userProfile = new UserProfile()