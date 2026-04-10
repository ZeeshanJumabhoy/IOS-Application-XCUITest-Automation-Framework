//
//  GesturePlaygroundTests.swift
//

import XCTest

final class GesturePlaygroundTests: BaseTest {

    func test_tapBoxIncrementsInteraction() {
        GesturePlaygroundPage.open(app: app).assertTapBoxIncrements()
    }

    func test_longPressBoxChangesState() {
        GesturePlaygroundPage.open(app: app).assertLongPressChangesState()
    }

    func test_doubleTapBox() {
        GesturePlaygroundPage.open(app: app).assertDoubleTapChangesState()
    }
}
