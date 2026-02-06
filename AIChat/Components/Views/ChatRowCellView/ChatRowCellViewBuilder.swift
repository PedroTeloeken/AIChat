//
//  ChatRowCellViewBuilder.swift
//  AIChat
//
//  Created by Pedro Teloeken on 25/12/25.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {
    
    var currentUserId: String?
    var chat: ChatModel = .mock
    var getAvatar: () async -> AvatarModel?
    var getLastChatMessage: () async -> ChatMessageModel?
    
    @State private var avatar: AvatarModel?
    @State private var lastChatMessage: ChatMessageModel?
    
    @State private var didLoadAvatar: Bool = false
    @State private var didLoadChatMessage: Bool = false
    
    private var isLoading: Bool {
        if didLoadAvatar && didLoadChatMessage {
            return false
        }
        
        return true
    }
    
    private var hasNewChat: Bool {
        guard let lastChatMessage, let currentUserId else { return false }
        
        return lastChatMessage.hasBeenSeenBy(userId: currentUserId)
    }
    
    private var subHeadline: String? {
        
        if isLoading {
            return "xxxxx xxxx xxxx"
        }
        
        if avatar == nil && lastChatMessage == nil {
            return "Error loading data."
        }
        
        return lastChatMessage?.content
    }
    
    var body: some View {
        ChatRowCellView(
            imageName: avatar?.profileImageName,
            headline: isLoading ? "xxxxx xxxx " : avatar?.name,
            subheadline: isLoading ? "xxxxx xxxx xxxx" : lastChatMessage?.content,
            hasNewChat: isLoading ? false : hasNewChat
        )
        .redacted(reason: isLoading ? .placeholder : [])
        .task {
            avatar = await getAvatar()
            didLoadAvatar = true
        }
        .task {
            lastChatMessage = await getLastChatMessage()
            didLoadChatMessage = true
        }
    }
    
}

#Preview {
    
    VStack {
        ChatRowCellViewBuilder(
            chat: .mock,
            getAvatar: {
                try? await Task.sleep(for: .seconds(5))
                return .mock
            },
            getLastChatMessage: {
                try? await Task.sleep(for: .seconds(5))
                
                return .mock
            }
        )
        ChatRowCellViewBuilder(
            chat: .mock,
            getAvatar: {
                .mock
            },
            getLastChatMessage: {
                .mock
            }
        )
        
        ChatRowCellViewBuilder(
            chat: .mock,
            getAvatar: {
                nil
            },
            getLastChatMessage: {
                nil
            }
        )
    }
    
    
}
