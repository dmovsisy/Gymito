//
//  GymitoUITests.swift
//  GymitoUITests
//
//  Created by David Movsisyan  on 2024-12-10.
//

import XCTest

final class GymitoProfileAndRegisterUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testRegisterViewShowsForm() {
        // Navigate to register screen
        app.staticTexts["Create Account"].tap()
        
        let nameField = app.textFields["full name"]
        XCTAssertTrue(nameField.waitForExistence(timeout: 2))
        
        let emailField = app.textFields["email"]
        let passwordField = app.secureTextFields["password"]
        
        XCTAssertTrue(emailField.exists)
        XCTAssertTrue(passwordField.exists)
    }
    
    func testRegisterFormValidationShowsError() {
        app.staticTexts["Create Account"].tap()
        
        let createButton = app.buttons["create account"]
        createButton.tap()
        
        // Expect some validation error to appear
        // (you may need to add an accessibilityIdentifier to an error Text view if you want to check it directly)
    }
    
    func testProfileViewShowsLoadingState() {
        // Navigate to profile tab
        app.tabBars.buttons["profile"].tap()
        
        let loadingText = app.staticTexts["Loading Profile..."]
        XCTAssertTrue(loadingText.waitForExistence(timeout: 2))
    }
    
    func testProfileViewSignOutButtonExists() {
        // Navigate to profile tab
        app.tabBars.buttons["profile"].tap()
        
        let signOutButton = app.buttons["signout"]
        XCTAssertTrue(signOutButton.waitForExistence(timeout: 2))
    }
}
