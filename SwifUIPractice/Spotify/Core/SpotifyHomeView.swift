//
//  SpotifyHomeView.swift
//  SwifUIPractice
//
//  Created by Roger Florat Gutierrez on 10/09/25.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var products: [Product] = []
    @State private var selectedCategory: Category? = nil
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders], content: {
                    Section {
                        
                        VStack(spacing: 16) {
                            recentsSection
                            
                            if let firstProduct = products.first {
                                newReleaseSection(product: firstProduct)
                            }
                            
                        } // VStack
                        .padding(.horizontal, 16)
                        
                        
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .fill(.red)
                                .frame(width: 200 , height: 200)
                        }
                    } header: {
                        header
                    }
                    
                })
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
            
        } // ZStack
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                } // HStack
                .padding(.horizontal, 16)
                
            } // ScrollView
            .scrollIndicators(.hidden)
            
        } // HStack
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(.spotifyBlack)
    }
    
    private var recentsSection : some View {
        NonLazyVGrid(columns: 2, spacing: 10, items: products) { product in
            if let product {
                SpotifyRecentsCell(
                    title: product.title, imageName: product.firstImage
                )
            }
        }
    }
    
    private func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description,
            onPlayPressed: nil,
            onAddToPlaylistPressed: nil
        )
    }
}

#Preview {
    SpotifyHomeView()
}
