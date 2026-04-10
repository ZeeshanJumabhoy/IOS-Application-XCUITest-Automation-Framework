//
//  GesturePlaygroundPage.swift
//

import XCTest

final class GesturePlaygroundPage {

    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    static func open(app: XCUIApplication) -> GesturePlaygroundPage {
        app.openDashboardModule(AccessibilityIds.Dashboard.gesturePlayground)
        return GesturePlaygroundPage(app: app)
    }

    func assertTapBoxIncrements() {
        let tapBox = app.element(identifier: AccessibilityIds.GesturePlayground.tapBox)
        tapBox.requirePresent(UITestDefaults.elementWait, "Tap box")
        XCTAssertTrue(app.staticTexts[TestLabels.GesturePlayground.taps0].exists)

        tapBox.tap()
        app.staticTexts[TestLabels.GesturePlayground.taps1].requirePresent(UITestDefaults.shortWait, "Tap count")

        app.tapBackButton()
        app.staticTexts[AccessibilityIds.HomeView.homeViewTitle].requirePresent(UITestDefaults.elementWait, "Dashboard")
    }

    func assertLongPressChangesState() {
        let box = app.element(identifier: AccessibilityIds.GesturePlayground.longPressBox)
        box.requirePresent(UITestDefaults.elementWait, "Long press box")
        box.press(forDuration: 1.2)
        app.staticTexts[TestLabels.GesturePlayground.longPressed].requirePresent(UITestDefaults.shortWait, "Long press")
        app.tapBackButton()
    }

    func assertDoubleTapChangesState() {
        let box = app.element(identifier: AccessibilityIds.GesturePlayground.doubleTapBox)
        box.requirePresent(UITestDefaults.elementWait, "Double tap box")
        box.doubleTap()
        app.staticTexts[TestLabels.GesturePlayground.doubleTapped].requirePresent(UITestDefaults.shortWait, "Double tap")
        app.tapBackButton()
    }
}
