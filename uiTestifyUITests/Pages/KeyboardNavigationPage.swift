//
//  KeyboardNavigationPage.swift
//

import XCTest

final class KeyboardNavigationPage {

    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func openKeyboardScreen() {
        app.openDashboardModule(AccessibilityIds.Dashboard.keyboardFocus)
    }

    func openNavigationFlow() {
        app.openDashboardModule(AccessibilityIds.Dashboard.navigationFlow)
    }

    func assertKeyboardFormSubmitSuccess() {
        openKeyboardScreen()

        app.enterTextInField(identifier: AccessibilityIds.Keyboard.usernameField, text: TestData.Keyboard.username)
        app.enterTextInField(identifier: AccessibilityIds.Keyboard.emailField, text: TestData.Keyboard.email)
        app.enterTextInSecureField(identifier: AccessibilityIds.Keyboard.passwordField, text: TestData.Keyboard.password)

        app.tapElement(identifier: AccessibilityIds.Form.submitButton)
        app.assertElementVisible(identifier: AccessibilityIds.Form.successMessage)

        app.tapBackButton()
    }

    func assertNavigationFlowTwoSteps() {
        openNavigationFlow()

        app.tapElement(identifier: AccessibilityIds.NavigationFlow.startFlowButton)

        app.enterTextInField(identifier: AccessibilityIds.Form.nameField, text: TestData.Navigation.userName)

        app.tapElement(identifier: AccessibilityIds.Form.nextButton)

        app.assertElementVisible(identifier: AccessibilityIds.Form.submitButton)
        app.tapElement(identifier: AccessibilityIds.Form.submitButton)

        app.assertElementVisible(identifier: AccessibilityIds.Form.successMessage)

        app.navigateBackToDashboard()
        app.staticTexts[AccessibilityIds.HomeView.homeViewTitle].requirePresent(UITestDefaults.elementWait, "Dashboard")
    }
}
