//
//  AccessibilityTabBarTests.swift
//

import XCTest

final class AccessibilityTabBarTests: BaseTest {

    private var page: AccessibilityTabBarPage { AccessibilityTabBarPage(app: app) }

    func test_accessibilityScreen_controlsExist() {
        page.assertAccessibilityControlsExist()
    }

    func test_tabBar_switchTabsAndBadgeToggle() {
        page.assertTabBarTabsAndBadge()
    }
}
