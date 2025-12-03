//
//  SettingsView.swift
//  AIChat
//
//  Created by Pedro Teloeken on 02/12/25.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(AppState.self) private var appState
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignOutPressed()
                } label: {
                    Text("Sign out")
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    func onSignOutPressed() {
        appState.updateViewState(showTabBarView: false)
    }
    
}

#Preview {
    SettingsView()
        .environment(AppState())
}
