//
//  MainTabView.swift
//  Tickers
//
//  Created by userext on 29/05/23.
//

import SwiftUI

struct MainTabView: View {
    @AppStorage("Name") var name: String = ""
    
    @State var isPresenting: Bool = false
    @State var currentScene: Int = 0
    @State var oldScene: Int = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $currentScene) {
                HomeView<Ticker>(tickersViewModel: TickersViewModel(), achievementViewModel: AchievementHomeViewModel())
                    .tabItem {
                        Label("Home", image: "HomeIcon")
                    }
                    .tag(0)
                    .onAppear {
                        oldScene = currentScene
                    }
                
                Text("")
                    .onAppear {
                        isPresenting = true
                        currentScene = oldScene
                    }
                    .fullScreenCover(isPresented: $isPresenting, content: {
                            PomodoroView(listTime: [
                                Time(remainigTime: 1500, isPomodoro: true, isRest: false),
                                Time(remainigTime: 300, isPomodoro: false, isRest: true)
                            ])
                    })
                    .tabItem {
                        Label("", image: "TimerIcon")
                    }
                    .tag(1)
                
                ProfileView()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Label("Perfil", image: "configurationGear")
                    }
                    .onAppear {
                        oldScene = currentScene
                    }
                    .tag(2)
            } // : TabView
            .navBarWithMissions(blackText: "Bem vindo,", blueText: name)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
