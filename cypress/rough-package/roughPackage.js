/**
 * Git doesn't recommend to save commented code in your repo
 * But if you really need to save any snippet of code you can use this file
 * Do not add commented code in your actual test or POM files
 */

/**
 * for LicenseDetails-to invoke the list of available states and save them in DataFile
 */
// getLicenseIssueStateList() {
//     let stateList = []
//     cy.readFile(step5_1DataFilePath).then((file) => {
//         cy.get(locators.stateDropDown).find('li').invoke('text').then((list) => {
//             stateList.push(list)
//             file["statesList"] = stateList
//             cy.writeFile(step5_1DataFilePath, file)
//         })
//     })
// }