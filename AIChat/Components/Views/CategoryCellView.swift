//
//  CategoryCellView.swift
//  AIChat
//
//  Created by Pedro Teloeken on 10/12/25.
//

import SwiftUI

struct CategoryCellView: View {
    
    var title: String = "Aliens"
    var imageName: String = Constants.randomImage
    var font: Font = .title2
    var cornerRadius: CGFloat = 16
    
    var body: some View {
        ImageLoaderView(urlString: imageName)
            .aspectRatio(1, contentMode: .fit)
            .overlay(
                alignment: .bottomLeading,
                content: {
                    Text(title)
                        .font(font)
                        .padding(16)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .addingGradientBackgroundForText()
                }
            )
            .cornerRadius(cornerRadius)

    }
}

#Preview {
    
    VStack {
        CategoryCellView()
            .frame(maxWidth: 150)
        
        CategoryCellView()
            .frame(maxWidth: 300)
        
        CategoryCellView()
            .frame(maxWidth: 400)
    }
    
}
