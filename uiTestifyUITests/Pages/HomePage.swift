//
//  HomePage.swift
//  uiTestifyUITests
//
//  Page object for the main dashboard (HomeView).
//

import XCTest

final class HomePage {

    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    // MARK: - Locators

    var dashboardTitle: XCUIElement {
        app.staticTexts[AccessibilityIds.HomeView.homeViewTitle]
    }

    var greeting: XCUIElement {
        app.element(identifier: AccessibilityIds.HomeView.userName)
    }

    var subtitle: XCUIElement {
        app.element(identifier: AccessibilityIds.HomeView.subtitle)
    }

    private func categorySection(_ id: String) -> XCUIElement {
        app.element(identifier: id)
    }

    private func dashboardModuleButton(_ id: String) -> XCUIElement {
        app.dashboardButton(identifier: id)
    }

    // MARK: - Actions & assertions

    func assertLaunchDashboardVisible() {
        dashboardTitle.requirePresent(UITestDefaults.elementWait, "Dashboard title")
        greeting.requirePresent(UITestDefaults.shortWait, "Greeting")
    }

    func assertGreetingAndSubtitleVisible() {
        app.assertElementVisible(identifier: AccessibilityIds.HomeView.userName)
        app.assertElementVisible(identifier: AccessibilityIds.HomeView.subtitle, timeout: UITestDefaults.shortWait)
    }

    func searchFormWizardAndAssertFiltered() {
        app.enterTextInField(
            identifier: AccessibilityIds.HomeView.searchField,
            text: TestData.Search.formWizardFilter
        )
        app.dismissKeyboardIfVisible()

        let wizard = dashboardModuleButton(AccessibilityIds.Dashboard.formWizard)
        app.scrollUntilVisible(wizard)
        wizard.requirePresent(UITestDefaults.shortWait, "Form Wizard row after filter")

        let gesture = dashboardModuleButton(AccessibilityIds.Dashboard.gesturePlayground)
        XCTAssertFalse(gesture.exists)
    }

    func assertDarkModeToggleChanges() -> Bool {
        app.tapSwiftUIToggleUntilValueChanges(accessibilityIdentifier: AccessibilityIds.HomeView.darkModeToggle)
    }

    func assertCategoryHeadersVisible() {
        let uiSection = categorySection(AccessibilityIds.DashboardCategory.uiTests)
        app.scrollUntilVisible(uiSection)
        app.assertElementVisible(identifier: AccessibilityIds.DashboardCategory.uiTests)

        let asyncSection = categorySection(AccessibilityIds.DashboardCategory.asyncTests)
        app.scrollUntilVisible(asyncSection)
        app.assertElementVisible(identifier: AccessibilityIds.DashboardCategory.asyncTests)
    }
}
