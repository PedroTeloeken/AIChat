//
//  ChatBubbleView.swift
//  AIChat
//
//  Created by Pedro Teloeken on 06/02/26.
//

import SwiftUI

struct ChatBubbleView: View {

    var text: String = "This is sample text."
    var textColor: Color = .primary
    var backGroundColor: Color = Color(uiColor: .systemGray6)
    var showImage: Bool = true
    var imageName: String?
    
    let offset: CGFloat = 14
    
    var body: some View {
        HStack(alignment: .top) {
            if showImage {
                ZStack {
                    if let imageName {
                        ImageLoaderView(urlString: imageName)
                    } else {
                        Rectangle()
                            .fill(.secondary)
                    }
                }
                .frame(width: 45, height: 45)
                .clipShape(Circle())
                .offset(y: 14)
            }
            
            Text(text)
                .font(.body)
                .foregroundStyle(textColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(backGroundColor)
                .cornerRadius(6)
            
        }
        .padding(.bottom, showImage ? offset : 0)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 16) {
            ChatBubbleView()
            ChatBubbleView(text: "Esse é um exemplo de uma mensagem um pouco maior do que o normal para o nosso teste visual ")
            
            ChatBubbleView(
                textColor: .white,
                backGroundColor: .accentColor,
                showImage: false,
                imageName: nil
            )
            
            ChatBubbleView(
                text: "Esse é um exemplo de uma mensagem um pouco maior do que o normal para o nosso teste visual ",
                textColor: .white,
                backGroundColor: .accentColor,
                showImage: false,
                imageName: nil
            )
            
        }
    }
}
