//
//  HomeView.swift
//  Tickers
//
//  Created by Ian Pacini on 07/06/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var tickersViewModel: TickersViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                Divider()
                
                ShowAllButtonView(title: "Escolha um Ticker para cuidar")
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 15) {
                        ForEach(tickersViewModel.tickers) { ticker in
                            CardPetView(isLocked: ticker.isLocked, actualProgress: ticker.actualProgress, totalProgress: ticker.totalProgress, tickerLevel: ticker.tickerLevel, tickerImage: ticker.tickerImage, tickerEgg: ticker.tickerEgg, tickerName: ticker.tickerName)
                        }
                    }
                    .padding(.trailing, 10)
                    .background(Color.orange)
                }
                .padding(.bottom, 50)
                
                ShowAllButtonView(title: "Conquistas")
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 15) {
                        ForEach(tickersViewModel.tickers) { ticker in
                            CardPetView(isLocked: ticker.isLocked, actualProgress: ticker.actualProgress, totalProgress: ticker.totalProgress, tickerLevel: ticker.tickerLevel, tickerImage: ticker.tickerImage, tickerEgg: ticker.tickerEgg, tickerName: ticker.tickerName)
                        }
                    }
                    .padding(.trailing, 10)
                    .background(Color.orange)
                }
                .padding(.bottom, 50)
            }
            
            .padding(.leading)
            .background(Color.pink.opacity(0.5))
            .navigationBarTitle("Home")
        }
    }
}

// MARK: - PreviewProvider
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(tickersViewModel: TickersViewModel())
    }
}
