//
//  AppViewBuilder.swift
//  AIChat
//
//  Created by Pedro Teloeken on 02/12/25.
//

import SwiftUI

struct AppViewBuilder<TabbarView: View, OnboardingView: View>: View {
    @Environment(AppState.self) private var appState

    @ViewBuilder var tabbarView: TabbarView
    @ViewBuilder var onboardingView: OnboardingView
    
    var body: some View {
        ZStack {
            if appState.showTabBar {
                tabbarView
                    .transition(.move(edge: .trailing))
            } else {
                onboardingView
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.smooth, value: appState.showTabBar)
    }
}

private struct PreviewView: View {
    
    @AppStorage("showTabbarView") var showTabBar: Bool = false
    
    @State private var showOnboardingView: Bool = false
    
    var body: some View {
        AppViewBuilder(
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
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview {
    PreviewView()
}
