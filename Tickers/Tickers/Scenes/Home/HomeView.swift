//
//  HomeView.swift
//  Tickers
//
//  Created by Ian Pacini on 07/06/23.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Proprieties
    @ObservedObject var tickersViewModel: TickersViewModel
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                Divider()
                createScrollView(title: "Escolha um Ticker para cuidar", tickers: tickersViewModel.tickers)
                    .padding(.bottom, 20)
                
                createScrollView(title: "Conquistas", tickers: tickersViewModel.tickers)
                    .padding(.bottom, 20)
            } //: VStack
            .padding(.leading)
            .background( Color("BackgroundColor"))
            .navigationBarTitle("Home")
        } //: Nav
    }
    
    // MARK: - ScrollView
    private func createScrollView(title: String, tickers: [Ticker]) -> some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 15) {
                ForEach(tickers) { ticker in
                    CardPetView(
                        isLocked: ticker.isLocked,
                        actualProgress: ticker.actualProgress,
                        totalProgress: ticker.totalProgress,
                        tickerLevel: ticker.tickerLevel,
                        tickerImage: ticker.tickerImage,
                        tickerEgg: ticker.tickerEgg,
                        tickerName: ticker.tickerName
                    )
                } //: ForEach
            } //: LazyHStack
            
            .background(.pink.opacity(0.5)) // DEBUG
        } //: ScrollView
        .overlay(
            ShowAllButtonView(title: title)
                .background(.green.opacity(0.7)) // DEBUG
                .frame(maxWidth: .infinity, alignment: .leading),
            alignment: .topLeading
        ) //: overlay
    } //: createScrollView
}

// MARK: - PreviewProvider
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(tickersViewModel: TickersViewModel())
    }
}
