//
//  LoginPage.swift
//  yavshok-ios
//
//  Created by Zuikaku on 27.07.2025.
//

import XCTest

final class LoginPage {
    
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    
    private var screenTitle: XCUIElement {
        return app.staticTexts["loginTitle"].firstMatch
    }
    
    private var emailField: XCUIElement {
        return app.textFields["emailField"].firstMatch
    }
    
    private var passwordField: XCUIElement {
        return app.secureTextFields["passwordField"].firstMatch
    }
    
    private var loginButton: XCUIElement {
        return app.buttons["loginButton"].firstMatch
    }
    
    private var toRegisterButton: XCUIElement {
        return app.buttons["registerButton"].firstMatch
    }
    
    private var backButton: XCUIElement {
        return app.buttons["backButton"].firstMatch
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
    func assertPasswordFieldIsDisplayed() -> Self {
        XCTAssert(passwordField.waitForExistence(timeout: 2))
        return self
    }
    
    @discardableResult
    func assertLoginButtonIsDisplayed() -> Self {
        XCTAssert(loginButton.waitForExistence(timeout: 2))
        return self
    }
    
    @discardableResult
    func assertToRegisterButtonIsDisplayed() -> Self {
        XCTAssert(toRegisterButton.waitForExistence(timeout: 2))
        return self
    }
    
    @discardableResult
    func assertBackButtonIsDisplayed() -> Self {
        XCTAssert(backButton.waitForExistence(timeout: 2))
        return self
    }
    
    
    @discardableResult
    func assertTextIsVisible(text: String) -> Self {
        XCTAssert(app.staticTexts[text].firstMatch.waitForExistence(timeout: 2))
        return self
    }
    
    
    @discardableResult
    func inputEmail(email: String) -> Self {
        emailField.tap()
        emailField.typeText(email)
        return self
    }
    
    @discardableResult
    func inputPassword(password: String) -> Self {
        passwordField.tap()
        passwordField.typeText(password)
        return self
    }
    
    @discardableResult
    func assertEmailFieldIsEmpty() -> Self {
        XCTAssert(emailField.placeholderValue.debugDescription.contains("Email"))
        return self
    }
    
    @discardableResult
    func assertPasswordFieldIsEmpty() -> Self {
        XCTAssert(passwordField.placeholderValue.debugDescription.contains("Пароль"))
        return self
    }
    
    
    @discardableResult
    func clickLoginButton() -> Self {
        loginButton.tap()
        return self
    }
    
    @discardableResult
    func clickToRegisterButton() -> Self {
        toRegisterButton.tap()
        return self
    }
    
    @discardableResult
    func clickBackButton() -> Self {
        backButton.tap()
        return self
    }
    
    @discardableResult
    func assertLoginButtonIsDisabled() -> Self {
        XCTAssert(!loginButton.isEnabled)
        return self
    }
    
}
