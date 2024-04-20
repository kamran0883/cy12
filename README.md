# LANE Automation Suite

LANE Automation Suite is a set of guidelines or rules used for creating and designing test cases for LANE SaaS based product. The framework is comprised of a combination of industry practices and modern tools that are designed to help LANE`s professionals test more efficiently.

The framework includes guidelines to coding standards, BDD approach that drive the entire framework, design patterns, test-data handling methods, page object classes, processes for storing test results, and custom utility functions on how to access external resources.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Technology Stack

- Cypress for Backend and Frontend Automation Testing
- NodeJS
- Javascript
- NPM as Build Tool
- Cucumber BDD as development approach
- Cucumber Preprocessor as Test Runner
- Azure Pipelines for CI/CD
- VS Code
- Git

## Framework Layers mapping

1. The Utilities & Resources Layer (L1): constants, lane-common, fixture-files, environments, cypress.config.js and plugins
2. The Pages / Microservices Layer (L2): pages and step definitions
3. The Test Suite Layer (L3): feature files

## Running the tests

On your local machine, you can run your tests using the Visual Studio Code
For building the project : npm install
For executing tests: npm run open:dev

### Break down into end to end tests

The project contains two folders inside the integration that contains all the feature file:

1. The e2e folder contains all the feature files and step defintions for UI level tests.These frontend tests will be executed on dealer tool and customer app pipelines with the tags.

### Coding Standards Quick Checklist

1. Use Intention Revealing & Searchable Names
2. Always start your Class Name with a Capital letter
3. Always start your Method Name with a verb/verb phrase and camelCase
4. Objects/Instances names should always be in lowercase
5. Use Hungarian notation for variable names
6. Pick One Word per Concept
7. Don’t Pun
8. Best Practice: 
   - For step definitions classes: use Screen_Feature-step-def e.g. **LenderProfile_AddressDetails-step-def.js**
   - For page classes: use Screen_Feature.spec e.g. **LenderProfile_AddressDetails.spec.js**
   - For Feature file: use Screen_Feature e.g. **LenderProfile_AddressDetails.feature**

## Git Branching Model

- Create new branch per test
- Describe branch name with Azure DevOps ticket + description
- Commit messages should be clear and concise.
- Commit code for common funcitonalities at the earliest.
- After finishing feature or test create a Pull Request
- Share it with team members for review

## Pull Requests

- Generate Pull requests before 5PM.
- Add your team member and lead in the reviewer section.*(At least 2 Reviewer)*
- Attach Test case/Task with the Pull Request.
- Author of PR will apply the changes if needed.
- Merge PR to master branch.

## Extra code

- use **rough-package** folder for any extra code which you have written but not used now.
- please comment the code in roughPackage.js file.

## Deployment

LANE-automation-suite will be downloaded as an artifact from nom registry for executing the test cases in DevOps pipeline.

## Authors

- Hamza Ashfaq - Initial Setup of the lane-automation-suite

## License

This project is copyright under the sole ownership of NETSOL Technologies Inc. NETSOL License - see the [LICENSE.md](LICENSE.md) file for details