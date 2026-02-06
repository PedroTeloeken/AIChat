//
//  ChatView.swift
//  AIChat
//
//  Created by Pedro Teloeken on 06/02/26.
//

import SwiftUI

struct ChatView: View {
    
    @State private var chatMessages: [ChatMessageModel] = ChatMessageModel.mocks
    @State private var avatar: AvatarModel? = .mock
    @State private var currentUser: UserModel? = .mock
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 24) {
                    ForEach(chatMessages) { message in
                        ChatBubbleViewBuilder(
                            message: message,
                            isCurrentUser: message.authorId == currentUser?.userId,
                            imageName: message.authorId == currentUser?.userId ? nil : avatar?.profileImageName
                        )
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(8)
            }
            
            Rectangle()
                .frame(height: 50)
        }
        .navigationTitle(avatar?.name ?? "Chat")
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
