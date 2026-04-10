//
//  KeyboardAndNavigationTests.swift
//

import XCTest

final class KeyboardAndNavigationTests: BaseTest {

    private var page: KeyboardNavigationPage { KeyboardNavigationPage(app: app) }

    func test_keyboardFocusSubmitSuccess() {
        page.assertKeyboardFormSubmitSuccess()
    }

    func test_navigationFlow_twoSteps() {
        page.assertNavigationFlowTwoSteps()
    }
}
