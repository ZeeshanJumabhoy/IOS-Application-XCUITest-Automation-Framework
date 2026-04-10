//
//  ListDialogPage.swift
//

import XCTest

final class ListDialogPage {

    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func openListInteraction() {
        app.openDashboardModule(AccessibilityIds.Dashboard.listInteraction)
    }

    func openDialogsAndSheets() {
        app.openDashboardModule(AccessibilityIds.Dashboard.dialogsAndSheets)
    }

    func assertListItemSelectionShowsCheckmark() {
        openListInteraction()

        let item1 = app.element(identifier: AccessibilityIds.List.listItem(title: "Item 1"))
        app.scrollUntilVisible(item1)
        item1.requirePresent(UITestDefaults.elementWait, "List item 1")
        item1.tap()
        app.assertElementVisible(
            identifier: AccessibilityIds.List.listItemCheckmark(title: "Item 1"),
            timeout: UITestDefaults.shortWait
        )

        app.tapBackButton()
    }

    func assertAlertAndConfirmation() {
        openDialogsAndSheets()

        app.tapElement(identifier: AccessibilityIds.Dialogs.showAlertButton)
        let alert = app.alerts[TestLabels.Alerts.importantAlert]
        alert.requirePresent(UITestDefaults.elementWait, "Alert")
        alert.buttons[TestLabels.System.ok].tap()

        app.tapElement(identifier: AccessibilityIds.Dialogs.showConfirmationButton)
        let optionA = app.buttons[TestLabels.Alerts.optionA]
        optionA.requirePresent(UITestDefaults.elementWait, "Option A")
        optionA.tap()

        app.staticTexts[TestLabels.Alerts.confirmationSelectionPrefix].requirePresent(
            UITestDefaults.elementWait,
            "Confirmation selection"
        )

        app.tapBackButton()
    }

    func assertSheetAndToast() {
        openDialogsAndSheets()

        app.tapElement(identifier: AccessibilityIds.Dialogs.showSheetButton)
        let sheet = app.descendants(matching: .any).matching(identifier: AccessibilityIds.Dialogs.modalSheet).firstMatch
        sheet.requirePresent(UITestDefaults.elementWait, "Sheet")
        sheet.swipeDown(velocity: .fast)

        app.tapElement(identifier: AccessibilityIds.Dialogs.showToastButton)
        app.assertElementVisible(identifier: AccessibilityIds.Dialogs.toastMessage, timeout: UITestDefaults.shortWait)

        app.tapBackButton()
    }
}
