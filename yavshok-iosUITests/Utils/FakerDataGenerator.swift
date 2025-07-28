//
//  FakerDataGenerator.swift
//  yavshok-ios
//
//  Created by Zuikaku on 28.07.2025.
//

import Fakery

enum FakerDataGenerator {
    
    private static let faker = Faker()

    
    static func generateEmail() -> String {
        faker.internet.email()
    }

    static func generateName() -> String {
        faker.name.firstName()
    }
    
    static func generatePassword() -> String {
        faker.internet.password(minimumLength: 5, maximumLength: 20)
    }
    
    static func generateShortPassword() -> String {
        faker.internet.password(minimumLength: 1, maximumLength: 4)
    }

    static func generateAge() -> String {
        String(faker.number.randomInt(min: 0, max: 99))
    }
    
}
