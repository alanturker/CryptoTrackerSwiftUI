//
//  SwiftUICryptoApp.swift
//  SwiftUICrypto
//
//  Created by Turker Alan on 14.03.2025.
//

import SwiftUI

@main
struct SwiftUICryptoApp: App {
     
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(vm)
        }
    }
}
