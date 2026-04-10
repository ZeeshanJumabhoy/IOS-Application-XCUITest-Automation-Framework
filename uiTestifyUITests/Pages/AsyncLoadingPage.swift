//
//  AsyncLoadingPage.swift
//

import XCTest

final class AsyncLoadingPage {

    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func open() {
        app.openDashboardModule(AccessibilityIds.Dashboard.asyncLoading)
    }

    func assertAsyncLoadReachesTerminalState() {
        open()

        app.tapElement(identifier: AccessibilityIds.AsyncLoading.loadButton)
        app.assertElementVisible(identifier: AccessibilityIds.AsyncLoading.loadingIndicator)

        let terminalIds = [
            AccessibilityIds.AsyncLoading.reloadButton,
            AccessibilityIds.AsyncLoading.retryButton,
            AccessibilityIds.AsyncLoading.emptyMessage,
            AccessibilityIds.AsyncLoading.itemAlpha,
            AccessibilityIds.AsyncLoading.errorMessage
        ]

        let deadline = Date().addingTimeInterval(18)
        var finished = false
        while Date() < deadline {
            if terminalIds.contains(where: { app.element(identifier: $0).exists }) {
                finished = true
                break
            }
            RunLoop.current.run(until: Date().addingTimeInterval(0.1))
        }
        XCTAssertTrue(finished, "Timed out waiting for async load to finish")

        app.navigateBackToDashboard()
    }
}
