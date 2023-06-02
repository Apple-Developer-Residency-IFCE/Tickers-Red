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
    
    static var defaultValue: Bool = true
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
    
}

struct CustomNavMissionsButtonHiddenPrefKey: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
    
}



extension View {
    
    func customNavigationBlackText(_ text: String) -> some View {
        preference(key: CustomNavBarBlackTextPrefKey.self, value: text)
    }
    
    func customNavigationBlueText(_ text: String) -> some View {
        preference(key: CustomNavBarBlueTextPrefKey.self, value: text)
    }

    func customNavBarBackButtonHidden(_ hidden: Bool) -> some View {
        preference(key: CustomNavBarBackButtonHiddenPrefKey.self, value: hidden)
    }
    
    func customNavMissionButtonHidden(_ hidden: Bool) -> some View {
        preference(key: CustomNavBarBackButtonHiddenPrefKey.self, value: hidden)
    }

}
