//
//  CreateAvatarView.swift
//  AIChat
//
//  Created by Pedro Teloeken on 29/12/25.
//

import SwiftUI

struct CreateAvatarView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var avatarName: String = ""
    
    @State private var characterOption: CharacterOption = .default
    @State private var characterAction: CharacterAction = .default
    @State private var characterLocation: CharacterLocation = .default
    
    @State private var isSaving: Bool = false
    @State private var isGenerating: Bool = false
    
    @State private var generateImage: UIImage?
    
    var body: some View {
        NavigationStack {
            List {
                nameSection
                
                attributesSection
                
                imageSection
                
                saveSection
            }
            .navigationTitle("Create Avatar")
            .toolbar {
                ToolbarItem(
                    placement: .topBarLeading,
                    content: {
                        backButton
                    }
                )
            }
        }
    }
    
    private var backButton: some View {
        Image(systemName: "xmark")
             .fontWeight(.semibold)
             .anyButton(option: .plain) {
                 onBackButtonPressed()
             }
    }
    
    private var nameSection: some View {
        Section {
            TextField("Player 1", text: $avatarName)
        } header: {
            Text("Name your avatar*")
        }
    }
    
    private var attributesSection: some View {
        Section {
            Picker(selection: $characterOption) {
                ForEach(CharacterOption.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized)
                        .tag(option)
                }
            } label: {
                Text("is a...")
            }
            
            Picker(selection: $characterAction) {
                ForEach(CharacterAction.allCases, id: \.self) { action in
                    Text(action.rawValue.capitalized)
                        .tag(action)
                }
            } label: {
                Text("that is a...")
            }
            
            Picker(selection: $characterLocation) {
                ForEach(CharacterLocation.allCases, id: \.self) { location in
                    Text(location.rawValue.capitalized)
                        .tag(location)
                }
            } label: {
                Text("in the ...")
            }
        
        } header: {
            Text("attributes")
        }
    }
    
    private var imageSection: some View {
        Section {
            HStack(alignment: .top, spacing: 8) {
                ZStack {
                    Text("Generate Image")
                        .underline()
                        .foregroundStyle(.accent)
                        .anyButton(option: .plain) {
                            onGenerateImagePressed()
                        }
                        .opacity(isGenerating ? 0 : 1)
                    
                    ProgressView()
                        .tint(.accent)
                        .opacity(isGenerating ? 1 : 0)
                }
                .disabled(isSaving || avatarName.isEmpty)
                
                Circle()
                    .fill(Color.secondary.opacity(0.3))
                    .overlay {
                        ZStack {
                            if let generateImage {
                                Image(uiImage: generateImage)
                                    .resizable()
                                    .scaledToFill()
                            }
                        }
                    }
                    .clipShape(Circle())
                
            }
            .padding(.vertical, 12)
        }
        .removeListRowFormatting()
    }
    
    private var saveSection: some View {
        Section {
            AsyncCallToActionButton(
                isLoading: isSaving,
                title: "Save",
                action: onSavePressed
            )
            .removeListRowFormatting()
            .padding(.top, 24)
            .opacity(generateImage == nil ? 0.5 : 1)
            .disabled(generateImage == nil)
        }
    }
    
    private func onBackButtonPressed() {
        dismiss()
    }
    
    private func onGenerateImagePressed() {
        isGenerating = true
        
        Task {
            try? await Task.sleep(for: .seconds(3))
            generateImage = UIImage(systemName: "star.fill")
            isGenerating = false
        }
    }
    
    private func onSavePressed() {
        isSaving = true
        
        Task {
            try? await Task.sleep(for: .seconds(3))
            dismiss()
            isSaving = false
        }
    }
}

#Preview {
    CreateAvatarView()
}
