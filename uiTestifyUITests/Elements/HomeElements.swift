//
//  HomeElement.swift
//  uiTestify
//
//  Created by Aman Kumar on 04/02/26.
//

import XCTest

final class HomeElements {

    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    var navigationTitle: XCUIElement {
        app.staticTexts[AccessibilityIds.HomeView.homeViewTitle]
    }
    
    var userName: XCUIElement {
        app.element(identifier: AccessibilityIds.HomeView.userName)
    }

    var searchField: XCUIElement {
        app.textFields.matching(identifier: AccessibilityIds.HomeView.searchField).firstMatch
    }

    var darkModeToggle: XCUIElement {
        app.switches.matching(identifier: AccessibilityIds.HomeView.darkModeToggle).firstMatch
    }
}
