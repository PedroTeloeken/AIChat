//
//  UserModel.swift
//  AIChat
//
//  Created by Pedro Teloeken on 25/12/25.
//

import Foundation
import SwiftUI

struct UserModel {
    
    let userId: String
    let dateCreated: Date?
    let didCompletedOnBoarding: Bool?
    let profileColorHex: String?
    
    init(
        userId: String,
        dateCreated: Date? = nil,
        didCompletedOnBoarding: Bool?,
        profileColorHex: String?
    ) {
        self.userId = userId
        self.dateCreated = dateCreated
        self.didCompletedOnBoarding = didCompletedOnBoarding
        self.profileColorHex = profileColorHex
    }
    
    var profileColorCalculated: Color {
        guard let profileColorHex else {
            return .accent
        }
        
        return Color(hex: profileColorHex)
    }
    
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
        [
            UserModel(
                userId: "user_001",
                dateCreated: Date().addingTimeInterval(days: -1),
                didCompletedOnBoarding: true,
                profileColorHex: "#33A1FF"
            ),
            UserModel(
                userId: "user_002",
                dateCreated: Date().addingTimeInterval(minutes: -32, hours: -21),
                didCompletedOnBoarding: false,
                profileColorHex: "#33A1FF"
            ),
            UserModel(
                userId: "user_003",
                dateCreated: Date().addingTimeInterval(minutes: -45),
                didCompletedOnBoarding: true,
                profileColorHex: "#2ECC71"
            ),
            UserModel(
                userId: "user_004",
                dateCreated: Date(),
                didCompletedOnBoarding: nil,
                profileColorHex: nil
            )
        ]
    }
    
}
