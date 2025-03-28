//
//  HomeStatsView.swift
//  SwiftUICrypto
//
//  Created by Turker Alan on 24.03.2025.
//

import SwiftUI

struct HomeStatsView: View {
    
    @Binding var screenSize: CGSize
    
    @EnvironmentObject private var vm: HomeViewModel
    
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: screenSize.width / 3)
            }
        }
        .frame(width: screenSize.width,
               alignment: showPortfolio ? .trailing : .leading)
    }
}

#Preview {
    let preview = DeveloperPreview()
    
    HomeStatsView(screenSize: .constant(CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)), showPortfolio: .constant(false))
        .environmentObject(preview.homeVM)
}
