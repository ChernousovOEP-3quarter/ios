//
//  ProfilePageTest.swift
//  yavshok-ios
//
//  Created by Zuikaku on 27.07.2025.
//

import XCTest

final class ProfilePageTest: XCTestCase {

    let app = XCUIApplication()
    
    private lazy var mainPage = MainPage(app: app)
    private lazy var loginPage = LoginPage(app: app)
    private lazy var registerPage = RegisterPage(app: app)
    private lazy var profilePage = ProfilePage(app: app)
        
    
    override func setUp() {
        super.setUp()
        app.launch()
        
        mainPage
            .assertPageIsOpened()
            .assertToLoginButtonIsDisplayed()
            .clickToLoginButton()
    }
    
    
    @MainActor
    func testLoginAndOpenProfileThenLogout() throws {
        loginPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertPasswordFieldIsDisplayed()
            .assertLoginButtonIsDisplayed()
            .inputEmail(email: EnvData.stored.email)
            .inputPassword(password: EnvData.stored.password)
            .clickLoginButton()
        
        profilePage
            .assertUserNameIsDisplayed()
            .assertLogoutButtonIsDisplayed()
            .clickLogoutButton()
        
        mainPage
            .assertPageIsOpened()
    }
    
    
    @MainActor
    func testRegisterAndOpenProfileThenLogout() throws {
        loginPage
            .assertPageIsOpened()
            .assertToRegisterButtonIsDisplayed()
            .clickToRegisterButton()
        
        registerPage
            .assertPageIsOpened()
            .assertEmailFieldIsDisplayed()
            .assertPasswordFieldIsDisplayed()
            .assertAgeFieldIsDisplayed()
            .assertRegisterButtonIsDisplayed()
            .inputEmail(email: FakerDataGenerator.generateEmail())
            .inputPassword(password: FakerDataGenerator.generatePassword())
            .inputAge(age: FakerDataGenerator.generateAge())
            .clickRegisterButton()
        
        profilePage
            .assertUserNameIsDisplayed()
            .assertLogoutButtonIsDisplayed()
            .clickLogoutButton()
        
        mainPage
            .assertPageIsOpened()
    }

}
