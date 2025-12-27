//
//  ChatModel.swift
//  AIChat
//
//  Created by Pedro Teloeken on 24/12/25.
//

import Foundation

struct ChatModel: Identifiable {
    
    let id: String
    let userId: String
    let avatarId: String
    let dateCreated: Date
    let dateModified: Date
    
    init(
        id: String,
        userId: String,
        avatarId: String,
        dateCreated: Date,
        dateModified: Date
    ) {
        self.id = id
        self.userId = userId
        self.avatarId = avatarId
        self.dateCreated = dateCreated
        self.dateModified = dateModified
    }
    
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
        [
            ChatModel(
                id: UUID().uuidString,
                userId: "mock_chat_1",
                avatarId: "avatar_1",
                dateCreated: Date().addingTimeInterval(days: 1),
                dateModified: Date().addingTimeInterval(hours: 1)
            ),
            ChatModel(
                id: UUID().uuidString,
                userId: "mock_chat_2",
                avatarId: "avatar_2",
                dateCreated: Date().addingTimeInterval(days: 2),
                dateModified: Date().addingTimeInterval(hours: 3)
            ),
            ChatModel(
                id: UUID().uuidString,
                userId: "mock_chat_3",
                avatarId: "avatar_3",
                dateCreated: Date().addingTimeInterval(days: 3),
                dateModified: Date().addingTimeInterval(minutes: 30)
            ),
            ChatModel(
                id: UUID().uuidString,
                userId: "mock_chat_4",
                avatarId: "avatar_4",
                dateCreated: Date().addingTimeInterval(days: 7),
                dateModified: Date().addingTimeInterval(minutes: 5)
            )
        ]
    }

}
