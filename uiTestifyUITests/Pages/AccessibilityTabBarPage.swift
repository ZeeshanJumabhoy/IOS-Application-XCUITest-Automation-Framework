//
//  AccessibilityTabBarPage.swift
//

import XCTest

final class AccessibilityTabBarPage {

    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func openAccessibilityScreen() {
        app.openDashboardModule(AccessibilityIds.Dashboard.accessibilityTest)
    }

    func openTabBarBehavior() {
        app.openDashboardModule(AccessibilityIds.Dashboard.tabBarBehavior)
    }

    func assertAccessibilityControlsExist() {
        openAccessibilityScreen()

        app.assertElementVisible(identifier: AccessibilityIds.AccessibilityScreen.header)
        XCTAssertTrue(app.element(identifier: AccessibilityIds.AccessibilityScreen.sizeCategoryText).exists)
        XCTAssertTrue(app.element(identifier: AccessibilityIds.AccessibilityScreen.leafImage).exists)
        XCTAssertTrue(app.element(identifier: AccessibilityIds.AccessibilityScreen.labeledButton).exists)

        app.tapBackButton()
    }

    func assertTabBarTabsAndBadge() {
        openTabBarBehavior()

        app.assertElementVisible(identifier: AccessibilityIds.TabBarTest.mainTabView)

        app.tapSwiftUIToggleRow(identifier: AccessibilityIds.TabBarTest.toggleBadge)

        let tabBar = app.tabBars.firstMatch
        tabBar.requirePresent(UITestDefaults.elementWait, "Tab bar")
        tabBar.buttons[TestLabels.TabBar.search].tapWhenReady()
        app.staticTexts[TestLabels.TabBar.searchTabTitle].requirePresent(UITestDefaults.shortWait, "Search tab")

        tabBar.buttons[TestLabels.TabBar.profile].tapWhenReady()
        app.staticTexts[TestLabels.TabBar.profileTabTitle].requirePresent(UITestDefaults.shortWait, "Profile tab")

        tabBar.buttons[TestLabels.TabBar.home].tapWhenReady()
        app.staticTexts[TestLabels.TabBar.homeTabTitle].requirePresent(UITestDefaults.shortWait, "Home tab")

        app.tapBackButton()
    }
}
