//
//  MainTabView.swift
//  Tickers
//
//  Created by userext on 29/05/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ContentView()
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
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
