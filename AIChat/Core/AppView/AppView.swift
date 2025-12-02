//
//  AppView.swift
//  AIChat
//
//  Created by Pedro Teloeken on 13/11/25.
//

import SwiftUI

struct AppView: View {
    
    @State var showTabBar: Bool = false
        
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Tabbar")
                }
            },
            onboardingView: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding")
                }
            }
        )
    }
}

#Preview("AppView - Tabbar") {
    AppView(showTabBar: true)
}

#Preview("AppView - Onboarding") {
    AppView(showTabBar: false)
}
