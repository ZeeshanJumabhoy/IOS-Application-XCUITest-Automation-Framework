//
//  BaseTest.swift
//  uiTestify
//
//  Created by Aman Kumar on 03/02/26.
//

import XCTest

class BaseTest: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments += ["-ui_testing"]
        app.launchEnvironment["UITEST_MODE"] = "1"
        launchApp()
    }

    override func tearDownWithError() throws {
        app?.terminate()
        app = nil
        try super.tearDownWithError()
    }

    /// Keep launch in one place for consistent behavior.
    func launchApp(timeout: TimeInterval = 15) {
        app.launch()
        XCTAssertTrue(
            app.wait(for: .runningForeground, timeout: timeout),
            "App failed to reach foreground state."
        )
    }
}
