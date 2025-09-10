//
//  SpotifyRecentsCell.swift
//  SwifUIPractice
//
//  Created by Roger Florat Gutierrez on 10/09/25.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    
    var title: String = "Some random title"
    var imageName: String = Constants.randomImage
    
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
                .background(.spotifyWhite)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
            
            
        } // HStack
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColor(isSelected: false)
        .cornerRadius(6)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SpotifyRecentsCell()
    }
}
