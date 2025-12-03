//
//  AppView.swift
//  AIChat
//
//  Created by Pedro Teloeken on 13/11/25.
//

import SwiftUI

struct AppView: View {
    
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
    }
}

#Preview("AppView - Tabbar") {
    AppView(appState: AppState(showTabBar: true))
}

#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTabBar: false))
}
