//
//  ImageLoaderView.swift
//  AIChat
//
//  Created by Pedro Teloeken on 02/12/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString: String = "https://picsum.photos/600/600"
    var resizingMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsTightening(true)
            ).clipped()
    }
}

#Preview {
    ImageLoaderView()
        .frame(width: 100, height: 200)
}
