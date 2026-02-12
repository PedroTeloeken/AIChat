//
//  ModelSupportView.swift
//  AIChat
//
//  Created by Pedro Teloeken on 11/02/26.
//

import SwiftUI

struct ModelSupportView<Content: View>: View {
    
    @Binding var showModel: Bool
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            if showModel {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .transition(AnyTransition.opacity.animation(.smooth))
                    .onTapGesture {
                        showModel = false
                    }
                    .zIndex(1)
                
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .zIndex(2)
                
            }
        }
        .zIndex(9999)
        .animation(.bouncy, value: showModel)
    }
}

extension View {
    func showModel(showModel: Binding<Bool>, @ViewBuilder content: () -> some View) -> some View {
        self
            .overlay(
                ModelSupportView(showModel: showModel) {
                    content()
                }
            )
    }
}

#Preview {
    ModelSupportView(
        showModel: .constant(true),
        content: {
        
    })
}
