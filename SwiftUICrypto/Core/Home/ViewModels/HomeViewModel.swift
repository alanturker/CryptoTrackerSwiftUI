//
//  HomeViewModel.swift
//  SwiftUICrypto
//
//  Created by Turker Alan on 14.03.2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(DeveloperPreview().coin)
            self.portfolioCoins.append(DeveloperPreview().coin)
        }
    }

}
