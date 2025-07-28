//
//  MainPage.swift
//  yavshok-ios
//
//  Created by Zuikaku on 26.07.2025.
//

import XCTest

final class MainPage {
    
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    
    private var screenTitle: XCUIElement {
        return app.staticTexts["mainTitle"].firstMatch
    }
    
    private var emailField: XCUIElement {
        return app.textFields["emailInput"].firstMatch
    }
    
    private var toLoginButton: XCUIElement {
        return app.buttons["navigationButton"].firstMatch
    }
    
    private var checkEmailButton: XCUIElement {
        return app.buttons["checkButton"].firstMatch
    }
    
    
    @discardableResult
    func assertPageIsOpened() -> Self {
        XCTAssert(screenTitle.waitForExistence(timeout: 2))
        return self
    }
    
    @discardableResult
    func assertEmailFieldIsDisplayed() -> Self {
        XCTAssert(emailField.waitForExistence(timeout: 2))
        return self
    }
    
    @discardableResult
    func assertToLoginButtonIsDisplayed() -> Self {
        XCTAssert(toLoginButton.waitForExistence(timeout: 2))
        return self
    }
    
    @discardableResult
    func assertCheckEmailButtonIsDisplayed() -> Self {
        XCTAssert(checkEmailButton.waitForExistence(timeout: 2))
        return self
    }
    
    
    @discardableResult
    func assertTextIsVisible(text: String) -> Self {
        XCTAssert(app.staticTexts[text].firstMatch.waitForExistence(timeout: 2))
        return self
    }
    
    @discardableResult
    func assertTextIsNotVisible(text: String) -> Self {
        XCTAssertFalse(app.staticTexts[text].firstMatch.waitForExistence(timeout: 2))
        return self
    }
    
    
    @discardableResult
    func assertEmailFieldIsEmpty() -> Self {
        XCTAssert(emailField.placeholderValue.debugDescription.contains("Email"))
        return self
    }
    
    @discardableResult
    func inputEmail(email: String) -> Self {
        emailField.tap()
        emailField.typeText(email)
        return self
    }
    
    
    @discardableResult
    func clickToLoginButton() -> Self {
        toLoginButton.tap()
        return self
    }
    
    @discardableResult
    func clickCheckEmailButton() -> Self {
        checkEmailButton.tap()
        return self
    }
    
}
