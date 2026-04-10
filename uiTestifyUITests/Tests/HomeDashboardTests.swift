//
//  HomeDashboardTests.swift
//

import XCTest

final class HomeDashboardTests: BaseTest {

    func test_greetingAndSubtitleVisible() {
        homePage.assertGreetingAndSubtitleVisible()
    }

    func test_searchFiltersModules() {
        homePage.searchFormWizardAndAssertFiltered()
    }

    func test_darkModeToggleIsTappable() {
        XCTAssertTrue(
            homePage.assertDarkModeToggleChanges(),
            "Dark mode toggle did not change within timeout (SwiftUI nested Switch is flaky — helper retries)."
        )
    }

    func test_categoryHeadersExist() {
        homePage.assertCategoryHeadersVisible()
    }
}
