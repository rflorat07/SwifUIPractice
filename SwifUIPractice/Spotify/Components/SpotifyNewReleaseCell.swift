//
//  SpotifyNewReleaseCell.swift
//  SwifUIPractice
//
//  Created by Roger Florat Gutierrez on 10/09/25.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    var imageName: String = Constants.randomImage
    var headline: String? = "New release from"
    var subheadline: String? = "Some artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single - title"
    
    var onPlayPressed: (() -> Void)? = nil
    var onAddToPlaylistPressed: (() -> Void)? = nil
    
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline)
                            .font(.callout)
                            .foregroundStyle(.spotifyLightGray)
                    }
                    
                    if let subheadline {
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                    
                } // VStack
                
            } // HStack
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32)  {
                    VStack(alignment: .leading, spacing: 2)  {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                                .lineLimit(1)
                        }
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                                .lineLimit(2)
                        }
                        
                    } // VStack
                    .font(.callout)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "plus.circle")
                            .font(.title3)
                            .padding(4)
                            .foregroundStyle(.spotifyLightGray)
                            .background(.black.opacity(0.001))
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        Image(systemName: "play.circle.fill")
                            .font(.title)
                            .foregroundColor(.spotifyLightGray)
                        
                    } // HStack
                    
                } // VStack
                .padding(.trailing, 16)
                
            } // HStack
            .themeColor(isSelected: false)
            .cornerRadius(8)
            .onTapGesture {
                onPlayPressed?()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        SpotifyNewReleaseCell()
            .padding()
    }
}
