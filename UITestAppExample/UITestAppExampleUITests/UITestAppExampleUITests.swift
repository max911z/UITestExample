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

    func testSuccessAuthFlow() throws {
        let app = XCUIApplication()
        app.launch()

		let usernameField = app.textFields["Username"]
		XCTAssertTrue(usernameField.exists)

		usernameField.tap()
		usernameField.typeText("student")

		let passwordSecureTextField = app.secureTextFields["Password"]
		XCTAssertTrue(passwordSecureTextField.exists)

		passwordSecureTextField.tap()
		passwordSecureTextField.typeText("password")

		let buttonContinue = app.buttons["Continue"]
		XCTAssertTrue(buttonContinue.exists)

		buttonContinue.tap()

		let accountLabel = app.staticTexts["Welcome!"]
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
