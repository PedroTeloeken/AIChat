//
//  SettingsView.swift
//  AIChat
//
//  Created by Pedro Teloeken on 02/12/25.
//

import SwiftUI
import SwiftfulUtilities

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState
    
    @State private var isPremium: Bool = false
    @State private var isAnonymousUser: Bool = true
    @State private var showCreateAccountView: Bool = false

    var body: some View {
        NavigationStack {
            List {
                accountSection
                
                purchaseSection
                
                applicationSection
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showCreateAccountView) {
                CreateAccountView()
                    .presentationDetents([.medium])
            }
        }
    }
    
    private var accountSection: some View {
        Section {
            if isAnonymousUser {
                Text("Save & back-up account")
                    .rowFormatting()
                    .anyButton(option: .press) {
                        onCreateAccountPressed()
                    }
            } else {
                Text("Sign out")
                    .rowFormatting()
                    .anyButton(option: .press) {
                        onSignOutPressed()
                    }
            }
            
            Text("Delete Account")
                .foregroundStyle(.red)
                .rowFormatting()
                .anyButton(option: .press) {
                    onSignOutPressed()
                }
        } header: {
            Text("Account")
        }
    }
    
    private var purchaseSection: some View {
        Section {
            HStack(spacing: 8) {
                Text("Account Status: \(isPremium ? "PREMIUM" : "FREE")")
                    
                Spacer(minLength: 0)
                
                if isPremium {
                    Text("MANAGE")
                        .badgeButton()
                }
            }
            .rowFormatting()
            .anyButton {
                
            }
            .disabled(!isPremium)
        
        } header: {
            Text("Purchases")
        }
    }
    
    private var applicationSection: some View {
        Section {
            HStack(spacing: 8) {
                Text("Version: ")
                    .rowFormatting()
                    
                Spacer(minLength: 0)
                
                Text(Utilities.appVersion ?? "")
                    .foregroundStyle(.secondary)
            }
            
            HStack(spacing: 8) {
                Text("Build Number: ")
                    .rowFormatting()
                    
                Spacer(minLength: 0)
                
                Text(Utilities.buildNumber ?? "")
                    .foregroundStyle(.secondary)
            }
        
            Text("Contact Us")
                .foregroundStyle(.blue)
                .rowFormatting()
                .anyButton(option: .press) {
                    
                }
        } header: {
            Text("Application")
        } footer: {
            Text("Created by Pedro Teloeken. \nLearn more www.technodev.com.br")
                .baselineOffset(6)
        }
    }
    
    func onSignOutPressed() {
        dismiss()
        appState.updateViewState(showTabBarView: false)
    }
    
    func onCreateAccountPressed() {
        self.showCreateAccountView = true
    }
    
}

fileprivate extension View {
    
    func rowFormatting() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(uiColor: .systemBackground))
            .listRowSeparator(.hidden)
    }
    
}

#Preview {
    SettingsView()
        .environment(AppState())
}
