//
//  UITestActions.swift
//  uiTestifyUITests
//
//  Reusable wait → act patterns on XCUIElement / XCUIApplication (SOLID: one place for interaction rules).
//

import XCTest

extension XCUIElement {

    /// Waits for the element using the project default timeout unless you pass another.
    @discardableResult
    func waitUntilPresent(_ timeout: TimeInterval = UITestDefaults.elementWait) -> Bool {
        waitForExistence(timeout: timeout)
    }

    /// Fails the test if the element does not appear in time.
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

    /// Wait, then tap (typical for buttons, rows, switches that are already queryable).
    func tapWhenReady(
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        requirePresent(timeout, "Cannot tap — element not found", file: file, line: line)
        tap()
    }

    /// Focus field (tap) then type text — common TextField / SecureField flow.
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

    /// Tap control located by accessibility identifier.
    func tapElement(
        identifier: String,
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        element(identifier: identifier).tapWhenReady(timeout: timeout, file: file, line: line)
    }

    /// Tap first match for identifier on a specific element type (e.g. text field).
    func tapTextField(
        identifier: String,
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        textFields.matching(identifier: identifier).firstMatch.tapWhenReady(timeout: timeout, file: file, line: line)
    }

    /// Tap field then type (identifier-based `TextField`).
    func enterTextInField(
        identifier: String,
        text: String,
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        textFields.matching(identifier: identifier).firstMatch.enterText(text, timeout: timeout, file: file, line: line)
    }

    /// Tap field then type (identifier-based `SecureField`).
    func enterTextInSecureField(
        identifier: String,
        text: String,
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        secureTextFields.matching(identifier: identifier).firstMatch.enterText(text, timeout: timeout, file: file, line: line)
    }

    /// Assert any descendant with this accessibility identifier is visible.
    func assertElementVisible(
        identifier: String,
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        element(identifier: identifier).requirePresent(timeout, "Missing element: \(identifier)", file: file, line: line)
    }

    /// Tap a visible button by accessibility label (title).
    func tapButton(
        labeled title: String,
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        buttons[title].tapWhenReady(timeout: timeout, file: file, line: line)
    }

    /// Tap a `Switch` located by accessibility identifier (uses first match).
    func tapSwitch(
        identifier: String,
        timeout: TimeInterval = UITestDefaults.elementWait,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        switches.matching(identifier: identifier).firstMatch.tapWhenReady(timeout: timeout, file: file, line: line)
    }
}
