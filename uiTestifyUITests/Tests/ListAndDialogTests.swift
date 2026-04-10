//
//  ListAndDialogTests.swift
//

import XCTest

final class ListAndDialogTests: BaseTest {

    private var page: ListDialogPage { ListDialogPage(app: app) }

    func test_listSelectionShowsCheckmark() {
        page.assertListItemSelectionShowsCheckmark()
    }

    func test_dialogsAlertAndConfirmation() {
        page.assertAlertAndConfirmation()
    }

    func test_modalSheetAndToast() {
        page.assertSheetAndToast()
    }
}
