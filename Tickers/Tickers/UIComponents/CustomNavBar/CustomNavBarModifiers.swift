//
//  CustomNavBarModifiers.swift
//  Tickers
//
//  Created by Ian Pacini on 07/06/23.
//

import SwiftUI


struct NavBarMainScreenModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        Text("go to missions!")
                    } label: {
                        Image("missions")
                    }
                }
            }
    }
}

struct NavBarSecondaryScreenModifer: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("returnArrow")
                    }
                }
            }
    }
}

extension View {
    func navBarMainScreen() -> some View {
        self.modifier(NavBarMainScreenModifier())
    }
    
    func navBarSecondaryScreen() -> some View {
        modifier(NavBarSecondaryScreenModifer())
    }
}
