//
//  BumbleChatView.swift
//  SwifUIPractice
//
//  Created by Roger Florat Gutierrez on 15/09/25.
//

import SwiftUI
import SwiftfulRouting

struct BumbleChatsView: View {
    
    @Environment(\.router) var router
    
    @State private var allUsers: [User] = []
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding(16)
                
                matchQueueSection
                
                recentChatsSection

            }
            
        }
        .task {
                await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        HStack(spacing: 6) {
            Image(systemName: "line.horizontal.3")
                .onTapGesture {
                    router.dismissScreen()
                }
            Spacer(minLength: 0)
            Image(systemName: "magnifyingglass")
        }
        .font(.title)
        .fontWeight(.medium)
    }
    
    private func getData() async {
        guard allUsers.isEmpty else { return }
        
        do {
            allUsers = try await DatabaseHelper().getUsers()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private var matchQueueSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Group {
                Text("Match Queue")
                +
                Text(" (\(allUsers.count))")
                    .foregroundStyle(.bumbleGray)
            }
            .padding(.leading, 16)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleProfileImageCell(
                            hasNewMessage: Bool
                                .random(),
                            imageName: user.image,
                            percentageRemaining: Double.random(in: 0...1)
                        )
                    }
                }
                .padding(.leading, 16)
            }
            .scrollIndicators(.hidden)
            .frame(height: 100)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var recentChatsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 0)  {
                Group {
                    Text("Chats")
                    +
                    Text(" (Recent)")
                        .foregroundStyle(.bumbleGray)
                }
                
                Spacer(minLength: 0)
                
                Image(systemName: "line.horizontal.3.decrease")
            }
            .padding(.leading, 16)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleChatPreviewCell(
                            username: user.firstName,
                            isYourMove: Bool.random(),
                            hasNewMessage: Bool.random(),
                            imageName: user.image,
                            percentageRemaining: Double.random(in: 0...1),
                            lastChatMessage: user.aboutMe
                        )
                        
                    }
                }
                .padding(16)
            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    BumbleChatsView()
}
