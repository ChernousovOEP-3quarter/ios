//
//  EditPageTest.swift
//  yavshok-ios
//
//  Created by Zuikaku on 28.07.2025.
//

import XCTest

final class EditPageTest: XCTestCase {

    let app = XCUIApplication()
    
    private lazy var mainPage = MainPage(app: app)
    private lazy var loginPage = LoginPage(app: app)
    private lazy var registerPage = RegisterPage(app: app)
    private lazy var profilePage = ProfilePage(app: app)
    private lazy var editPage = EditPage(app: app)
        
    
    override func setUp() {
        super.setUp()
        app.launch()
        
        mainPage
            .assertPageIsOpened()
            .assertToLoginButtonIsDisplayed()
            .clickToLoginButton()
        
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
            .assertEditButtonIsDisplayed()
            .clickEditButton()
    }
    
    
    @MainActor
    func testChangeAndSaveUserName() throws {
        editPage
            .assertPageIsOpened()
            .assertNameFieldIsDisplayed()
            .clearNameField()
            .inputName(name: FakerDataGenerator.generateName())
            .clickSaveButton()
        
        profilePage
            .assertUserNameIsDisplayed()
            .assertLogoutButtonIsDisplayed()
            .clickLogoutButton()
    }
    
    
    @MainActor
    func testCancelUserNameChange() throws {
        editPage
            .assertPageIsOpened()
            .assertCancelButtonIsDisplayed()
            .clickCancelButton()
        
        profilePage
            .assertUserNameIsDisplayed()
            .assertLogoutButtonIsDisplayed()
            .clickLogoutButton()
    }

    
    @MainActor
    func testLockSaveButtonWhenNameFieldIsEmpty() throws {
        editPage
            .assertPageIsOpened()
            .assertNameFieldIsDisplayed()
            .clearNameField()
            .clickSaveButton()
            .assertSaveButtonIsDisabled()
            .clickCancelButton()
        
        profilePage
            .assertUserNameIsDisplayed()
            .assertLogoutButtonIsDisplayed()
            .clickLogoutButton()
    }
    
}
