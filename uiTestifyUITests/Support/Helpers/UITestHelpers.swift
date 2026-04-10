//
//  UITestHelpers.swift
//  uiTestifyUITests
//

import XCTest

extension XCUIApplication {

    func element(identifier: String) -> XCUIElement {
        descendants(matching: .any).matching(identifier: identifier).element
    }

    func dashboardButton(identifier: String) -> XCUIElement {
        buttons.matching(identifier: identifier).firstMatch
    }

    func scrollUntilVisible(_ element: XCUIElement, maxSwipes: Int = 16) {
        let scrollView = scrollViews.firstMatch
        var swipes = 0
        var swipeUpDirection = true

        while swipes < maxSwipes {
            if element.exists && element.isHittable {
                return
            }

            if scrollView.exists {
                if swipeUpDirection {
                    scrollView.swipeUp()
                } else {
                    scrollView.swipeDown()
                }
            } else {
                if swipeUpDirection {
                    swipeUp(velocity: .fast)
                } else {
                    swipeDown(velocity: .fast)
                }
            }

            swipes += 1
            if swipes == maxSwipes / 2 {
                swipeUpDirection = false
            }
        }
    }

    func tapBackButton() {
        let back = navigationBars.buttons.element(boundBy: 0)
        if back.waitForExistence(timeout: UITestDefaults.interactionWait) {
            back.tap()
        }
    }

    func navigateBackToDashboard(maxSteps: Int = 8) {
        for _ in 0..<maxSteps {
            if staticTexts[AccessibilityIds.HomeView.homeViewTitle].exists {
                return
            }
            tapBackButton()
        }
    }

    func openDashboardModule(_ moduleAccessibilityId: String) {
        let link = dashboardButton(identifier: moduleAccessibilityId)

        _ = link.waitForExistence(timeout: UITestDefaults.shortWait)
        scrollUntilVisible(link)

        guard link.exists else {
            XCTFail("Could not find module: \(moduleAccessibilityId)")
            return
        }

        if !link.isHittable {
            scrollUntilVisible(link, maxSwipes: 8)
        }

        XCTAssertTrue(link.isHittable, "Module exists but is not tappable: \(moduleAccessibilityId)")
        link.tap()
    }

    func dismissKeyboardIfVisible() {
        guard keyboards.count > 0 else { return }

        let keyboard = keyboards.firstMatch
        if keyboard.buttons["Search"].exists {
            keyboard.buttons["Search"].tap()
            return
        }
        if keyboard.buttons["Return"].exists {
            keyboard.buttons["Return"].tap()
            return
        }
        if keyboard.buttons["Done"].exists {
            keyboard.buttons["Done"].tap()
            return
        }

        if navigationBars.firstMatch.exists {
            navigationBars.firstMatch.tap()
        } else {
            coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.1)).tap()
        }
    }

    @discardableResult
    func tapSwiftUIToggleUntilValueChanges(accessibilityIdentifier id: String, overallTimeout: TimeInterval = 12) -> Bool {
        let row = switches.matching(identifier: id).firstMatch
        guard row.waitForExistence(timeout: UITestDefaults.elementWait) else { return false }

        let before = Self.switchValueString(bestEffortFor: row)
        let deadline = Date().addingTimeInterval(overallTimeout)
        var attempt = 0

        while Date() < deadline {
            attempt += 1
            let thumb = Self.innerThumbSwitch(under: row)

            switch attempt % 3 {
            case 1:
                if thumb.exists, thumb.isHittable {
                    thumb.tap()
                } else {
                    row.coordinate(withNormalizedOffset: CGVector(dx: 0.92, dy: 0.5)).tap()
                }
            case 2:
                row.coordinate(withNormalizedOffset: CGVector(dx: 0.90, dy: 0.5)).tap()
            default:
                if thumb.exists {
                    thumb.coordinate(withNormalizedOffset: CGVector(dx: 0.55, dy: 0.5)).tap()
                } else {
                    row.tap()
                }
            }

            if Self.waitForSwitchValueChange(from: before, row: row, within: 2.0) {
                return true
            }

            RunLoop.current.run(until: Date().addingTimeInterval(0.2))
        }

        return false
    }

    /// Prefer this over `tapSwitch` for SwiftUI `Toggle` rows (identifier on outer `Switch`, real thumb nested).
    func tapSwiftUIToggleRow(
        identifier: String,
        overallTimeout: TimeInterval = 12,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertTrue(
            tapSwiftUIToggleUntilValueChanges(accessibilityIdentifier: identifier, overallTimeout: overallTimeout),
            "SwiftUI toggle did not change: \(identifier)",
            file: file,
            line: line
        )
    }

    private static func innerThumbSwitch(under row: XCUIElement) -> XCUIElement {
        let nested = row.descendants(matching: .switch)
        guard nested.count > 0 else { return row }
        return nested.element(boundBy: max(0, nested.count - 1))
    }

    private static func switchValueString(bestEffortFor row: XCUIElement) -> String {
        if let v = row.value as? String { return v }
        let thumb = innerThumbSwitch(under: row)
        if let v = thumb.value as? String { return v }
        return ""
    }

    private static func waitForSwitchValueChange(from before: String, row: XCUIElement, within: TimeInterval) -> Bool {
        let end = Date().addingTimeInterval(within)
        while Date() < end {
            let rowVal = switchValueString(bestEffortFor: row)
            let thumb = innerThumbSwitch(under: row)
            let thumbVal = (thumb.value as? String) ?? rowVal
            if rowVal != before || thumbVal != before {
                return true
            }
            RunLoop.current.run(until: Date().addingTimeInterval(0.05))
        }
        return false
    }
}
