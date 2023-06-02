//
//  NavScreenWBarView.swift
//  Tickers
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct NavScreenWBarView<Content: View>: View {
    
    let content: Content
    
    @State private var showReturnButton: Bool = true
    @State private var textBlack: String = ""
    @State private var textBlue: String = ""
    @State private var showMissions: Bool = false
    
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBar(showReturnButton: showReturnButton, textBlack: textBlack, textBlue: textBlue, showMissions: showMissions)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarBackButtonHiddenPrefKey.self, perform: { value in
            self.showReturnButton = value
        })
        
        .onPreferenceChange(CustomNavBarBlackTextPrefKey.self, perform: { value in
            self.textBlack = value
        })
        
        .onPreferenceChange(CustomNavBarBlueTextPrefKey.self, perform: { value in
            self.textBlue = value
        })
        
        .onPreferenceChange(CustomNavMissionsButtonHiddenPrefKey.self, perform: { value in
            self.showReturnButton = !value
        })
    }
}

struct NavScreenWBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavScreenWBarView {
            ContentView()
                .customNavBarBackButtonHidden(false)
                .customNavigationBlackText("Alo")
                .customNavigationBlueText("Bodia")
        }
    }
}
