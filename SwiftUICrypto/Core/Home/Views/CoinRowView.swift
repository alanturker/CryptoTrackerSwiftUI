//
//  CoinListView.swift
//  SwiftUICrypto
//
//  Created by Turker Alan on 14.03.2025.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    @Binding var screenSize: CGSize
    @Binding var showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingsColumn {
                middleColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .padding(.leading)
                .foregroundStyle(Color.theme.accent)
        }
    }
    
    private var middleColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text(coin.currentHoldings?.asNumberString() ?? "")
        }
        .foregroundStyle(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundStyle(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                )
        }
        .frame(width: screenSize.width / 3.5, alignment: .trailing)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
        let preview = DeveloperPreview()
    CoinRowView(coin: preview.coin, screenSize: .constant(CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)), showHoldingsColumn: .constant(true))
}
