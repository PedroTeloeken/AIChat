//
//  OnBoardingIntroView.swift
//  AIChat
//
//  Created by Pedro Teloeken on 03/12/25.
//

import SwiftUI

struct OnBoardingIntroView: View {
    var body: some View {
        VStack {
            Group {
                Text("Make your own ")
                +
                Text("avatars ")
                    .foregroundStyle(.accent)
                    .fontWeight(.semibold)
                +
                Text("and chat with then? \n\nHave ")
                +
                Text("real conversation ")
                    .foregroundStyle(.accent)
                    .fontWeight(.semibold)
                +
                Text("generated responses.")
            }
            .baselineOffset(6)
            .frame(maxHeight: .infinity)
            .padding(24)
            
            NavigationLink {
                OnboardingColorView()
            } label: {
                Text("Continue")
                    .callToActionButton()
            }
        }
        .padding(24)
        .font(.title3)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    OnBoardingIntroView()
}
