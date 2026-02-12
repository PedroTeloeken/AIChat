//
//  ChatBubbleViewBuilder.swift
//  AIChat
//
//  Created by Pedro Teloeken on 06/02/26.
//

import SwiftUI

struct ChatBubbleViewBuilder: View {
    
    var message: ChatMessageModel = .mock
    var isCurrentUser: Bool = false
    var imageName: String?
    var onImagePressed: (() -> Void)?

    var body: some View {
        ZStack {
            ChatBubbleView(
                text: message.content ?? "",
                textColor: isCurrentUser ? .white : .primary,
                backGroundColor: isCurrentUser ? .accent : Color(uiColor: .systemGray6),
                showImage: !isCurrentUser,
                imageName: imageName,
                onImagePressed: onImagePressed
            )
            .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
            .padding(.leading, isCurrentUser ? 75 : 0)
            .padding(.trailing, isCurrentUser ? 0 : 75)
        }
    }
}

#Preview {
    ScrollView {
        VStack {
            ChatBubbleViewBuilder()
            ChatBubbleViewBuilder(isCurrentUser: true)
            
            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authorId: UUID().uuidString,
                    content: "Essa é uma mansagem muito grande, para ver como tá o chat",
                    seenById: nil,
                    dateCreated: .now
                ),
                isCurrentUser: false
            )
            
            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authorId: UUID().uuidString,
                    content: "Essa é uma mansagem muito grande, para ver como tá o chat",
                    seenById: nil,
                    dateCreated: .now
                ),
                isCurrentUser: true
            )
        }
    }
}
