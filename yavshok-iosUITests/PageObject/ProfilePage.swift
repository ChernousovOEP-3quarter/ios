//
//  ProfilePage.swift
//  yavshok-ios
//
//  Created by Zuikaku on 27.07.2025.
//

import XCTest

final class ProfilePage {
    
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    
    private var userName: XCUIElement {
        return app.staticTexts["userName"].firstMatch
    }
    
    private var editButton: XCUIElement {
        return app.buttons["editProfileButton"].firstMatch
    }
    
    private var logoutButton: XCUIElement {
        return app.buttons["logoutButton"].firstMatch
    }
    
    
    @discardableResult
    func assertUserNameIsDisplayed() -> Self {
        XCTAssert(userName.waitForExistence(timeout: 2))
        return self
    }
    
    @discardableResult
    func assertEditButtonIsDisplayed() -> Self {
        XCTAssert(editButton.waitForExistence(timeout: 2))
        return self
    }
    
    @discardableResult
    func assertLogoutButtonIsDisplayed() -> Self {
        XCTAssert(logoutButton.waitForExistence(timeout: 2))
        return self
    }
    
    
    @discardableResult
    func clickEditButton() -> Self {
        editButton.tap()
        return self
    }
    
    @discardableResult
    func clickLogoutButton() -> Self {
        logoutButton.tap()
        return self
    }
    
}
