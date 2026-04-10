//
//  FormFlowTests.swift
//

import XCTest

final class FormFlowTests: BaseTest {

    private var formPage: FormFlowPage { FormFlowPage(app: app) }

    func test_formTesting_validationErrorThenSuccess() {
        formPage.runFormTestingValidationThenSuccess()
    }

    func test_formWizard_completeFlow() {
        formPage.runFormWizardCompleteFlow()
    }
}
