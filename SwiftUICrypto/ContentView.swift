//
//  ContentView.swift
//  SwiftUICrypto
//
//  Created by Turker Alan on 14.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State var screenSize: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack {}
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(.purple)
            
            GeometryReader { proxy in
                VStack {}
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .background(.blue)
            }
            
            VStack {}
                .frame(width: screenSize.width, height: screenSize.height)
                .background(.pink)
        }
        .overlay {
            GeometryReader { proxy in
                Color.clear.preference(key: SizePreferenceKey.self, value: proxy.size)
            }
        }
        .onPreferenceChange(SizePreferenceKey.self) { value in
            screenSize = value
        }
    }
}



#Preview {
    ContentView()
}
