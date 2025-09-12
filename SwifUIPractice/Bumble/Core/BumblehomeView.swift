//
//  BumblehomeView.swift
//  SwifUIPractice
//
//  Created by Roger Florat Gutierrez on 12/09/25.
//

import SwiftUI

struct BumblehomeView: View {
    
    @State private var options: [String] = ["Everyone", "Trending"]
    @AppStorage("bumble_home_filter") private var selection: String = "Everyone"
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 12)  {
                header
                
                BumbleFilterView(selection: $selection, options: options)
                    .background(Divider(), alignment: .bottom)
                
                Spacer()
                
            } // VStack
            .padding(8)
        }
    }
    
    private var header : some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
            } // HStack
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Bumble")
                .font(.title)
                .foregroundStyle(.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            
        } // HStack
        .font(.title2)
        .fontWeight(.medium)
        .foregroundStyle(.bumbleBlack)
    }
}

#Preview {
    BumblehomeView()
}
