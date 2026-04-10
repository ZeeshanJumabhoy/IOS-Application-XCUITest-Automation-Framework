//
//  UITestActions.swift
//  uiTestifyUITests
//

import XCTest

extension XCUIElement {

    @discardableResult
    func waitUntilPresent(_ timeout: TimeInterval = UITestDefaults.elementWait) -> Bool {
        waitForExistence(timeout: timeout)
    }

    func requirePresent(
        _ timeout: TimeInterval = UITestDefaults.elementWait,
        _ message: String? = nil,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let ok = waitUntilPresent(timeout)
        let text = message ?? "Element did not appear within \(timeout)s"
        XCTAssertTrue(ok, text, file: file, line: line)
    }

    func tapWhenReady(
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        requirePresent(timeout, "Cannot tap — element not found", file: file, line: line)
        tap()
    }

    func enterText(
        _ text: String,
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        tapWhenReady(timeout: timeout, file: file, line: line)
        typeText(text)
    }
}

extension XCUIApplication {

    func tapElement(
        identifier: String,
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        element(identifier: identifier).tapWhenReady(timeout: timeout, file: file, line: line)
    }

    func tapTextField(
        identifier: String,
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        textFields.matching(identifier: identifier).firstMatch.tapWhenReady(timeout: timeout, file: file, line: line)
    }

    func enterTextInField(
        identifier: String,
        text: String,
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        textFields.matching(identifier: identifier).firstMatch.enterText(text, timeout: timeout, file: file, line: line)
    }

    func enterTextInSecureField(
        identifier: String,
        text: String,
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        secureTextFields.matching(identifier: identifier).firstMatch.enterText(text, timeout: timeout, file: file, line: line)
    }

    func assertElementVisible(
        identifier: String,
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        element(identifier: identifier).requirePresent(timeout, "Missing element: \(identifier)", file: file, line: line)
    }

    func tapButton(
        labeled title: String,
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        buttons[title].tapWhenReady(timeout: timeout, file: file, line: line)
    }

    func tapSwitch(
        identifier: String,
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        switches.matching(identifier: identifier).firstMatch.tapWhenReady(timeout: timeout, file: file, line: line)
    }
}
