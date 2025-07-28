//
//  LoginPageTest.swift
//  yavshok-ios
//
//  Created by Zuikaku on 27.07.2025.
//

import XCTest

final class LoginPageTest: XCTestCase {

    let app = XCUIApplication()
    
    private lazy var mainPage = MainPage(app: app)
    private lazy var loginPage = LoginPage(app: app)
        
    
    override func setUp() {
        super.setUp()
        app.launch()
        
        mainPage
            .assertPageIsOpened()
            .assertToLoginButtonIsDisplayed()
            .clickToLoginButton()
    }
    
    
    @MainActor
    func testRedirectBackToMainPage() throws {
        loginPage
            .assertPageIsOpened()
            .assertBackButtonIsDisplayed()
            .clickBackButton()
        
        mainPage
            .assertPageIsOpened()
    }
    
    
    @MainActor
    func testThrowWarningForIncorrectUserEmail() throws {
        loginPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertPasswordFieldIsDisplayed()
            .assertLoginButtonIsDisplayed()
            .inputEmail(email: FakerDataGenerator.generateEmail())
            .inputPassword(password: EnvData.stored.password)
            .clickLoginButton()
            .assertTextIsVisible(text: "Email или пароль неправильные")
    }
    
    
    @MainActor
    func testLockLoginButtonForEmptyEmail() throws {
        loginPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertPasswordFieldIsDisplayed()
            .assertLoginButtonIsDisplayed()
            .assertEmailFieldIsEmpty()
            .inputPassword(password: EnvData.stored.password)
            .clickLoginButton()
            .assertLoginButtonIsDisabled()
    }
    
    
    @MainActor
    func testLockLoginButtonForEmptyPassword() throws {
        loginPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertPasswordFieldIsDisplayed()
            .assertLoginButtonIsDisplayed()
            .inputEmail(email: EnvData.stored.email)
            .assertPasswordFieldIsEmpty()
            .clickLoginButton()
            .assertLoginButtonIsDisabled()
    }
    
}
