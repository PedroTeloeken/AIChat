//
//  AppView.swift
//  AIChat
//
//  Created by Pedro Teloeken on 13/11/25.
//

import SwiftUI

struct AppView: View {
    
    @Environment(\.authService) private var authService
    @State var appState = AppState()

    var body: some View {
        AppViewBuilder(
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
        .task {
            await checkUserStatus()
        }
    }
    
    private func checkUserStatus() async {
        if let user = await authService.getAuthenticatedUser() {
            
            print("User already authenticated: \(user.uid)")
        } else {
            do {
                let result = try await authService.signInAnonymously()
                
                print("Sign in anonymous success: \(result.user.uid)")
            } catch {
                print(error)
            }
        }
    }
    
}

#Preview("AppView - Tabbar") {
    AppView(appState: AppState(showTabBar: true))
}

#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTabBar: false))
}
