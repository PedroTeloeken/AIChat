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
    @State private var textFieldText = ""
    
    @State private var showChatSettings: Bool = false
    @State private var scrollPosition: String?

    var body: some View {
        VStack(spacing: 0) {
            scrollViewSection
            
            textFieldSection
                
        }
        .navigationTitle(avatar?.name ?? "Chat")
        .toolbarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "ellipsis")
                    .padding(8)
                    .anyButton {
                        onSettingsPressed()
                    }
            }
        }
        .confirmationDialog(
            "What whould you like to do?",
            isPresented: $showChatSettings,
            actions: {
                Button("Report User / Chat", role: .destructive) {
                    
                }
                
                Button("Delete / Chat", role: .destructive) {
                    
                }
            },
            message: {
                Text("What would you like to do?")
            }
        )
    }
    
    private var scrollViewSection: some View {
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
            .rotationEffect(.degrees(180))
        }
        .rotationEffect(.degrees(180))
        .scrollPosition(id: $scrollPosition, anchor: .center)
        .animation(.default, value: scrollPosition)
    }
    
    private var textFieldSection: some View {
        TextField("Say something", text: $textFieldText)
            .keyboardType(.alphabet)
            .autocorrectionDisabled()
            .padding(12)
            .padding(.trailing, 60)
            .overlay(
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 32))
                    .padding(.trailing, 4)
                    .foregroundStyle(.accent)
                    .anyButton(option: .plain, action: {
                        onSendMessagePressed()
                    })
                , alignment: .trailing
            )
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color(uiColor: .systemBackground))
                    
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                }
            )
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color(uiColor: .secondarySystemBackground))
    }
    
    private func onSendMessagePressed() {
        guard let currentUser else { return }
        let messageText = textFieldText
        
        let message = ChatMessageModel(
            id: UUID().uuidString,
            chatId: UUID().uuidString,
            authorId: currentUser.userId,
            content: messageText,
            seenById: nil,
            dateCreated: .now
        )
        
        scrollPosition = message.id
        
        chatMessages.append(message)
        textFieldText = ""
    }
    
    private func onSettingsPressed() {
        showChatSettings = true
    }
    
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
