//
//  TickersView.swift
//  Tickers
//
//  Created by Julia Morales on 19/07/23.
//

import SwiftUI

struct TickersView: View {
    @ObservedObject var tickersViewModel: TickersViewModel
        
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        var body: some View {
            NavigationView{
                VStack(alignment: .leading){
                    ScrollView{
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(tickersViewModel.tickers) { ticker in
                                CardPetView(isLocked: ticker.isLocked, actualProgress: ticker.actualProgress, totalProgress: ticker.totalProgress, tickerLevel: ticker.tickerLevel, tickerImage: ticker.tickerImage, tickerEgg: ticker.tickerEgg, tickerName: ticker.tickerName)
                            }
                        }//Vgrid
                        .padding(.horizontal)
                    }//scrollView
                        .padding(.bottom, 10)
                        .padding(.top, -7)
                }//Vstack
                .navBarWithBackButton(blackText: "Escolha um Ticker")
                .background{
                    Color("BackgroundColor")
                        .padding(.bottom, 10)
                }
            }//navView
            .navigationBarBackButtonHidden(true)
        }
    }

    struct TickersView_Previews: PreviewProvider {
        static var previews: some View {
            TickersView(tickersViewModel: TickersViewModel())
        }
    }
