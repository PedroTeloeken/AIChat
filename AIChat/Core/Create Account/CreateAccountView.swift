//
//  CreateAccountView.swift
//  AIChat
//
//  Created by Pedro Teloeken on 27/12/25.
//

import SwiftUI
internal import AuthenticationServices

struct CreateAccountView: View {
    
    var title: String = "Create Account?"
    var subtitle: String = "Don't lose your data! Connect to SSO provider to save your account."
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text(subtitle)
                    .font(.body)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            SignInWithAppleButtonView(
                type: .signUp,
                style: .black, cornerRadius: 30
            )
            .frame(height: 50)
            .anyButton(option: .press) {
                
            }
            
            Spacer()
        }
        .padding(16)
        .padding(.top, 40)
    }
}

#Preview {
    CreateAccountView()
}
