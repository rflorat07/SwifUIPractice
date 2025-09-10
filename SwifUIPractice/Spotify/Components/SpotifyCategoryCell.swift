//
//  SpotifyCategoryCell.swift
//  SwifUIPractice
//
//  Created by Roger Florat Gutierrez on 10/09/25.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title: String = "All"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColor(isSelected: isSelected)
            .cornerRadius(16)
    }
}

extension View {
    
    func themeColor(isSelected: Bool) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SpotifyCategoryCell(title: "Title goes here", isSelected: true)
    }
}
