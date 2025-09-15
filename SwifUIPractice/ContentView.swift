//
//  ContentView.swift
//  SwifUIPractice
//
//  Created by Roger Florat Gutierrez on 09/09/25.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @Environment(\.router) var router
    
    var body: some View {
        List {
            Button("Open Spotify") {
                router.showScreen(.fullScreenCover) { _ in
                    SpotifyHomeView()
                }
            }
            
            Button("Open Bumble") {
                router.showScreen(.fullScreenCover) { _ in
                    BumbleHomeView()
                }
            }
//            
//            Button("Open Netflix") {
//                router.showScreen(.fullScreenCover) { _ in
//                    //NetflixHomeView()
//                }
//            }
        }
    }
}

#Preview {
    RouterView { _ in
        ContentView()
    }
}
