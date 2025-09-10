//
//  SpotifyPlaylistView.swift
//  SwifUIPractice
//
//  Created by Roger Florat Gutierrez on 10/09/25.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    
    var user: User = .mock
    var product: Product = .mock
    
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product._brand,
                        imageName: product.thumbnail
                   )
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheadline: product.category,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                }
            }
            .scrollIndicators(.hidden)
            
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
