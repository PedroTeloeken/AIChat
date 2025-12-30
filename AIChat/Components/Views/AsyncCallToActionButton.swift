//
//  AsyncCallToActionButton.swift
//  AIChat
//
//  Created by Pedro Teloeken on 30/12/25.
//

import SwiftUI

struct AsyncCallToActionButton: View {
    
    var isLoading: Bool = false
    var title: String = "Save"
    var action: () -> Void
    
    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
                    .tint(.white)
            } else {
                Text(title)
            }
        }
        .callToActionButton()
        .anyButton(option: .press) {
            action()
        }
        .disabled(isLoading)
    }
}

#Preview {
    
    @Previewable var isLoading: Bool = false
    
    AsyncCallToActionButton(
        isLoading: isLoading,
        title: "Save2",
        action: {
            Task {
                try? await Task.sleep(for: .seconds(3))
            }
        }
    )
    .previewLayout(.sizeThatFits)
    .padding()
}
