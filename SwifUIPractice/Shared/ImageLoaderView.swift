//
//  ImageLoaderView.swift
//  SwifUIPractice
//
//  Created by Roger Florat Gutierrez on 09/09/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var resizingMode: ContentMode = .fill
    var urlString: String = Constants.randomImage
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay {
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
}
