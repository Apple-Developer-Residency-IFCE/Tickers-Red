//
//  CustomNavBarPrefKeys.swift
//  Tickers
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct CustomNavBarBlackTextPrefKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
}

struct CustomNavBarBlueTextPrefKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
}

struct CustomNavBarBackButtonHiddenPrefKey: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
    
}

struct CustomNavBarMissionsButtonHiddenPrefKey: PreferenceKey {
    
    static var defaultValue: Bool = true
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
    
}

extension View {
    
    func customNavigationBlackText(_ blackText: String) -> some View {
        preference(key: CustomNavBarBlackTextPrefKey.self, value: blackText)
    }
    
    func customNavigationBlueText(_ blueText: String) -> some View {
        preference(key: CustomNavBarBlueTextPrefKey.self, value: blueText)
    }

    func customNavBarReturnButtonHidden(_ returnHidden: Bool) -> some View {
        preference(key: CustomNavBarBackButtonHiddenPrefKey.self, value: returnHidden)
    }
    
    func customNavBarMissionButtonHidden(_ missionsHidden: Bool) -> some View {
        preference(key: CustomNavBarMissionsButtonHiddenPrefKey.self, value: missionsHidden)
    }
    
    func customNavBarItems(blackText: String = "", blueText: String = "", returnHidden: Bool = false, missionsHidden: Bool = true) -> some View {
        self
            .customNavBarReturnButtonHidden(returnHidden)
            .customNavigationBlackText(blackText)
            .customNavigationBlueText(blueText)
            .customNavBarMissionButtonHidden(missionsHidden)
    }

}
