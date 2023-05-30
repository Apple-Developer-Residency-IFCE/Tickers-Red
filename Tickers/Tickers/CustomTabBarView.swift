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
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            // https://www.hackingwithswift.com/quick-start/swiftui/adding-tabview-and-tabitem
            Text("Bookmark Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text("Bookmark")
                }
            
            Text("Video Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "video.circle.fill")
                    Text("Video")
                }
            
            Text("Profile Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        } // : TabView
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}
