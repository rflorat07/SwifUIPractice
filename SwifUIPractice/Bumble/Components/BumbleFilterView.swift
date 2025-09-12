//
//  BumbleFilterView.swift
//  SwifUIPractice
//
//  Created by Roger Florat Gutierrez on 12/09/25.
//

import SwiftUI

struct BumbleFilterView: View {
    
    @Namespace private var namespace
    @Binding var selection: String
    
    var options: [String] = ["Everyone", "Trending"]
    
    var body: some View {
        HStack(alignment: .top, spacing: 32) {
            ForEach(options, id: \.self) { option in
                VStack(spacing: 8){
                    Text(option)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .fontWeight(.medium)

                    if selection == option {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }

                    
                } // VStack
                .padding(.top, 8)
                .background(.black.opacity(0.001))
                .foregroundStyle(selection == option ? .bumbleBlack : .bumbleGray)
                .onTapGesture {
                    selection = option
                }
            }
        } // HStack
        .animation(.smooth, value: selection)
    }
}

fileprivate struct BumbleFilterViewPreview: View {
    
    @State private var selection: String = "Everyone"
    
    var options: [String] = ["Everyone", "Trending", "Music"]
    
    var body: some View {
        BumbleFilterView(selection: $selection, options: options)
    }
}

#Preview {
    BumbleFilterViewPreview()
        .padding()
}
