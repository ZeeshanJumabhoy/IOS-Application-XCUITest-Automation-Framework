//
//  SmokeTests.swift
//  uiTestify
//
//  Created by Aman Kumar on 03/02/26.
//

import XCTest

final class SmokeTests: BaseTest {

    func test_appLaunchesAndDashboardIsVisible() {
        XCTAssertEqual(app.state, .runningForeground)
        homePage.assertLaunchDashboardVisible()
    }
}
