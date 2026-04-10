//
//  NetworkPerformancePage.swift
//

import XCTest

final class NetworkPerformancePage {

    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func openNetworkState() {
        app.openDashboardModule(AccessibilityIds.Dashboard.networkState)
    }

    func openLoadTest() {
        app.openDashboardModule(AccessibilityIds.Dashboard.loadTest)
    }

    func assertNetworkToggleAndRetry() {
        openNetworkState()

        app.tapSwiftUIToggleRow(identifier: AccessibilityIds.Network.onlineToggle)
        app.tapSwiftUIToggleRow(identifier: AccessibilityIds.Network.onlineToggle)

        app.tapElement(identifier: AccessibilityIds.AsyncLoading.retryButton)

        app.tapBackButton()
    }

    func assertLoadTestSearchFiltersToSingleItem() {
        openLoadTest()

        app.enterTextInField(identifier: AccessibilityIds.PerformanceLoad.searchField, text: TestData.Performance.searchFilter)

        let row = app.element(identifier: AccessibilityIds.PerformanceLoad.listItem(label: "Item 500"))
        app.scrollUntilVisible(row)
        row.requirePresent(UITestDefaults.elementWait, "Filtered row")

        let countLabel = app.element(identifier: AccessibilityIds.PerformanceLoad.itemCountLabel)
        countLabel.requirePresent(UITestDefaults.shortWait, "Count label")
        XCTAssertTrue(countLabel.label.contains("1"), "Expected filtered count 1, got: \(countLabel.label)")

        app.tapBackButton()
    }
}
