//
//  TestData.swift
//  uiTestifyUITests
//
//  Typed test input strings (keeps tests free of magic literals).
//

enum TestData {

    enum Search {
        static let formWizardFilter = "Form Wizard"
    }

    enum Form {
        static let nameJane = "Jane"
        static let emailJane = "jane@example.com"
        static let wizardName = "Wizard User"
        static let wizardEmail = "wiz@example.com"
        static let wizardAge = "30"
    }

    enum Keyboard {
        static let username = "user1"
        static let email = "user1@mail.com"
        static let password = "secret"
    }

    enum Navigation {
        static let userName = "Nav User"
    }

    enum Performance {
        static let searchFilter = "500"
    }
}
