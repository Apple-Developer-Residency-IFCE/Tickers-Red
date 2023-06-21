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
        NavigationView{
            VStack(alignment: .leading){
                Divider()
                Text("Seus tickers").tickerFont(size: 20, weight: .bold)
                    .foregroundColor(.blue)
                    .padding(.leading, 20)
                    .padding(.bottom, -5)
                
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(tickersViewModel.tickers) { ticker in
                            CardPetView(isLocked: ticker.isLocked, actualProgress: ticker.actualProgress, totalProgress: ticker.totalProgress, tickerLevel: ticker.tickerLevel, tickerImage: ticker.tickerImage, tickerEgg: ticker.tickerEgg, tickerName: ticker.tickerName)
                        }
                    }//Vgrid
                    .padding(.horizontal)
                }//scrollView
                Divider()
                    .padding(.bottom, 10)
                    .padding(.top, -7)
            }//Vstack
            .background{
                Color("BackgroundColor")
                    .padding(.bottom, 10)
            }
        }//navView
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(tickersViewModel: TickersViewModel())
    }
}
