//
//  FormFlowPage.swift
//

import XCTest

final class FormFlowPage {

    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func openFormTesting() {
        app.openDashboardModule(AccessibilityIds.Dashboard.formTesting)
    }

    func openFormWizard() {
        app.openDashboardModule(AccessibilityIds.Dashboard.formWizard)
    }

    func runFormTestingValidationThenSuccess() {
        openFormTesting()

        app.tapElement(identifier: AccessibilityIds.Form.submitButton)
        app.assertElementVisible(identifier: AccessibilityIds.Form.errorMessage, timeout: UITestDefaults.shortWait)

        app.enterTextInField(identifier: AccessibilityIds.Form.nameField, text: TestData.Form.nameJane)
        app.enterTextInField(identifier: AccessibilityIds.Form.emailField, text: TestData.Form.emailJane)
        app.tapSwiftUIToggleRow(identifier: AccessibilityIds.Form.termsToggle)

        app.tapElement(identifier: AccessibilityIds.Form.submitButton)
        app.assertElementVisible(identifier: AccessibilityIds.Form.successMessage)
        XCTAssertFalse(app.element(identifier: AccessibilityIds.Form.errorMessage).exists)

        app.tapBackButton()
    }

    func runFormWizardCompleteFlow() {
        openFormWizard()

        app.assertElementVisible(identifier: AccessibilityIds.Form.wizardNameField)
        app.enterTextInField(identifier: AccessibilityIds.Form.wizardNameField, text: TestData.Form.wizardName)
        app.enterTextInField(identifier: AccessibilityIds.Form.wizardEmailField, text: TestData.Form.wizardEmail)

        app.tapElement(identifier: AccessibilityIds.Form.wizardNextButton)

        app.assertElementVisible(identifier: AccessibilityIds.Form.ageField)
        app.enterTextInField(identifier: AccessibilityIds.Form.ageField, text: TestData.Form.wizardAge)

        app.tapElement(identifier: AccessibilityIds.Form.wizardNextButton)

        app.assertElementVisible(identifier: AccessibilityIds.Form.confirmationSummary)
        app.tapElement(identifier: AccessibilityIds.Form.wizardNextButton)

        app.tapButton(labeled: TestLabels.Sheet.close, timeout: UITestDefaults.longWait)
        app.tapBackButton()
    }
}
