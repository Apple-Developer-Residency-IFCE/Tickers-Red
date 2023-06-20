//
//  TickersApp.swift
//  Tickers
//
//  Created by Lucas Oliveira on 23/05/23.
//

import SwiftUI

@main
struct TickersApp: App {
    @AppStorage("preferredAppearence") var preferredAppearence: Appearence?
    
    var body: some Scene {
        WindowGroup {
           MainTabView()
        }
    }
}
