//
//  BumbleChatPreviewCell.swift
//  SwifUIPractice
//
//  Created by Roger Florat Gutierrez on 15/09/25.
//

import SwiftUI

struct BumbleChatPreviewCell: View {
    
    var username: String = "Nick"
    var isYourMove: Bool = true
    var hasNewMessage: Bool = true
    var imageName: String = Constants.randomImage
    var percentageRemaining: Double = Double.random(in: 0...1)
    var lastChatMessage: String? = "his is the last mess asdf asdf asdf asdf asdf asdf asdf asdasdf asdf asdf asdf asdf asdf asdf asdf age."
    
    var body: some View {
        HStack(spacing: 16) {
            BumbleProfileImageCell(
                hasNewMessage: hasNewMessage,
                imageName: imageName,
                percentageRemaining: percentageRemaining
            )
            
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 0) {
                    Text(username)
                        .font(.headline)
                        .foregroundStyle(.bumbleBlack)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if isYourMove {
                        Text("YOUR MOVE")
                            .font(.caption2)
                            .bold()
                            .padding(.vertical, 4)
                            .padding(.horizontal, 6)
                            .background(.bumbleYellow)
                            .cornerRadius(32)
                        
                    }
                }
                
                if let lastChatMessage {
                    Text(lastChatMessage)
                        .font(.subheadline)
                        .foregroundStyle(.bumbleGray)
                        .padding(.trailing, 16)
                }
            }
            .lineLimit(1)
        }
    }
}

#Preview {
    BumbleChatPreviewCell()
        .padding()
}
