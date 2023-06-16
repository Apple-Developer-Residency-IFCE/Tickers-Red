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
            TabView {
                ZStack{
                    Color(red: 245, green: 245, blue: 245)
                    
                    VStack(alignment: .leading){
                        Text("Seus tickers").tickerFont(size: 20, weight: .bold)
                            .foregroundColor(.blue)
                            .padding(.leading, 20)
                        
                        ScrollView{
                            LazyVGrid(columns: columns, spacing: 12) {
                                ForEach(tickersViewModel.tickers.tickers) { ticker in
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 160, height: 175)
                                        Image(ticker.tickerImage)
                                    }//trocar por cardpet
                                }
                            }//Vgrid
                            .padding(.horizontal)
                        }//scrollView
                        Divider()
                    }//Vstack
                } //zStack
                
                .tabItem {
                    Label("Home", image: "HomeIcon")
                }
                
                
                Text("Tela de Timer ⏱")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                
                    .tabItem {
                        Label("", image: "TimerIcon")
                    }
                
                
                Text("Tela de Perfil")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Label("Perfil", image: "configurationGear")
                    }
            } // : TabView
            .navBarWithMissions(blackText: "Bem vindo,", blueText: "Fulaninho")
        }//navView
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(tickersViewModel: TickersViewModel())
    }
}
