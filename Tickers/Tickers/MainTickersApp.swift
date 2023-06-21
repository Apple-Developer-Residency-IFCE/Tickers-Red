//
//  TickersApp.swift
//  Tickers
//
//  Created by Lucas Oliveira on 23/05/23.
//

import SwiftUI

@main
struct TickersApp: App {
    @AppStorage("themeSelected") var themeSelected: Theme?
    
    var body: some Scene {
        WindowGroup {
            MainTabView().preferredColorScheme(themeSelected?.toColorScheme)
        }
    }
}
