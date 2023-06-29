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
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Divider()
                createScrollView(
                  title: "Escolha um Ticker para cuidar",
                  tickers: tickersViewModel.tickers
                )
                createScrollView(
                  title: "Conquistas",
                  tickers: tickersViewModel.tickers
                )
            } //: VStack
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.leading)
            .background(Color("BackgroundColor"))
            .navigationBarTitle("Home")
        } //: Nav
    }
    
    // MARK: - ScrollView
    private func createScrollView(title: String, tickers: [Ticker]) -> some View {
      VStack(spacing: 0) {
        ShowAllButtonView(title: title)
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
          .padding()
        } //: ScrollView
      } //: VStack
      .fixedSize(horizontal: false, vertical: true)
    } //: createScrollView
}

// MARK: - PreviewProvider
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(tickersViewModel: TickersViewModel())
    }
}
