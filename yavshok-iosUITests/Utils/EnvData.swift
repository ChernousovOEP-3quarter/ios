//
//  EnvData.swift
//  yavshok-ios
//
//  Created by Zuikaku on 28.07.2025.
//

import SwiftDotenv


struct EnvData {
    static let stored = EnvData()

    let email: String
    let password: String

    private init() {

        // В envPath поменять полный путь .env на свой:
        let envPath = "/Users/zuikaku/Desktop/Yandex_SHOCK_projects/ios/assets/.env"

        do {
            try Dotenv.configure(atPath: envPath)
            print("✅ Dotenv loaded from: \(envPath)")
        } catch {
            print("❌ Failed to load .env file at \(envPath): \(error)")
        }

        self.email = Dotenv["TEST_EMAIL"]?.stringValue ?? "wrong@example.com"
        self.password = Dotenv["TEST_PASSWORD"]?.stringValue ?? "password123"
    }
}
