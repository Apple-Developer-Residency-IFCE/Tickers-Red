//
//  AppNavBarView.swift
//  Tickers
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            Text("Lucas")
                .customNavigationBlackText("Oie, ")
                .customNavigationBlueText("Caio")
                .customNavBarMissionButtonHidden(false)
                .customNavBarBackButtonHidden(true)
        }
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}
