//
//  ChatMessageModel.swift
//  AIChat
//
//  Created by Pedro Teloeken on 24/12/25.
//

import Foundation

struct ChatMessageModel: Identifiable {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenById: [String]?
    let dateCreated: Date?
    
    init(
        id: String,
        chatId: String,
        authorId: String? = nil,
        content: String? = nil,
        seenById: [String]? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenById = seenById
        self.dateCreated = dateCreated
    }
    
    func hasBeenSeenBy(userId: String) -> Bool {
        guard let seenById else { return true }
        return seenById.contains(userId)
    }
    
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
        [
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat_1",
                authorId: "user_001",
                content: "Hey! How are you?",
                seenById: ["user_2", "user_3"],
                dateCreated: Date().addingTimeInterval(minutes: 10)
            ),
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat_1",
                authorId: "user_2",
                content: "I'm good! And you?",
                seenById: ["user_1"],
                dateCreated: Date().addingTimeInterval(minutes: 8)
            ),
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat_1",
                authorId: "user_001",
                content: "Doing great, thanks 😄",
                seenById: ["user_2"],
                dateCreated: Date().addingTimeInterval(minutes: 5)
            ),
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat_2",
                authorId: nil,
                content: "User_3 joined the chat",
                seenById: nil,
                dateCreated: Date().addingTimeInterval(hours: 1)
            ),
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat_2",
                authorId: "user_3",
                content: "Hello everyone 👋",
                seenById: [],
                dateCreated: Date().addingTimeInterval(minutes: 2)
            )
        ]
    }
}
