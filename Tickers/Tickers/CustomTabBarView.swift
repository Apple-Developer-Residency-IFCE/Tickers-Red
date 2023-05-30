//
//  CustomTabBarView.swift
//  Tickers
//
//  Created by userext on 29/05/23.
//

import SwiftUI

struct CustomTabBarView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            // https://www.hackingwithswift.com/quick-start/swiftui/adding-tabview-and-tabitem
            Text("Bookmark Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Label("Bookmark", systemImage: "bookmark.circle.fill")
                }
            
            Text("Video Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Label("Video", systemImage: "video.circle.fill")
                }
            
            Text("Profile Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        } // : TabView
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}
