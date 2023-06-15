//
//  HomeView.swift
//  Tickers
//
//  Created by Ian Pacini on 07/06/23.
//

import SwiftUI

struct mockTick: Identifiable{
    var id: Int
    var imagT: String
    var imagE: String
    var islock: Bool
}

let tick1 = mockTick(id: 1, imagT: "babyCatAwake", imagE: "eggBLue", islock: false)
let tick2 = mockTick(id: 2, imagT: "babyCatAwake", imagE: "eggPink", islock: true)
let tick3 = mockTick(id:3 , imagT: "babyCatAwake", imagE: "eggGreen", islock: true)
let tick4 = mockTick(id:4 , imagT: "babyCatAwake", imagE: "eggGreen", islock: true)
let tick5 = mockTick(id:5 , imagT: "babyCatAwake", imagE: "eggGreen", islock: true)
let tick6 = mockTick(id:6 , imagT: "babyCatAwake", imagE: "eggGreen", islock: true)
let tick7 = mockTick(id:7 , imagT: "babyCatAwake", imagE: "eggGreen", islock: true)

let tickers = [tick1, tick2, tick3, tick4, tick5, tick6]

struct HomeView: View {
    
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
                                ForEach(tickers) { ticker in
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 160, height: 175)
                                        Image(ticker.imagT)
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
        HomeView()
    }
}
