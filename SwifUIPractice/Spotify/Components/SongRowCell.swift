//
//  SongRowCell.swift
//  SwifUIPractice
//
//  Created by Roger Florat Gutierrez on 10/09/25.
//

import SwiftUI

struct SongRowCell: View {
    
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage
    var title: String = "Some song name goes here"
    var subtitle: String? = "Some artist name"
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    
    var body: some View {
        HStack(spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                
                if let subtitle {
                    Text(subtitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
            } // VStack
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
        .onTapGesture {
            onCellPressed?()
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
    }
}
