//
//  UITestAppExampleUITests.swift
//  UITestAppExampleUITests
//
//  Created by Maksim Neverovskij on 22.12.2022.
//

import XCTest

class UITestAppExampleUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testSuccessAuthFlowWithValidInfo() throws {
        let app = XCUIApplication()
		let usernameField = app.textFields["Username"]
		let passwordSecureTextField = app.secureTextFields["Password"]
		let buttonContinue = app.buttons["Continue"]
		let accountLabel = app.staticTexts["Welcome!"]

		app.launch()
		usernameField.tap()
		usernameField.typeText("student")
		passwordSecureTextField.tap()
		passwordSecureTextField.typeText("password")
		buttonContinue.tap()
		XCTAssertTrue(accountLabel.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
