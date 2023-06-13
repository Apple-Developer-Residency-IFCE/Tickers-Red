//
//  CustomNavBarModifiers.swift
//  Tickers
//
//  Created by Ian Pacini on 07/06/23.
//

import SwiftUI


struct NavBarWithMissions: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    var blackText: String
    var blueText: String
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Text(blackText).tickerFont(size: 20, weight: .bold)
                        Text(blackText).tickerFont(size: 20, weight: .bold)
                            .foregroundColor(.blue)
                    }
                }
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

struct NavBarWithBackButton: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    var blackText: String
    var blueText: String
    
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
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Text(blackText).tickerFont(size: 20, weight: .bold)
                        Text(blackText).tickerFont(size: 20, weight: .bold)
                            .foregroundColor(.blue)
                    }
                }
            }
    }
}

extension View {
    func navBarWithMissions(blackText: String = "", blueText: String = "") -> some View {
        self.modifier(NavBarWithMissions(blackText: blackText, blueText: blueText))
    }
    
    func navBarWithBackButton(blackText: String = "", blueText: String = "") -> some View {
        self.modifier(NavBarWithBackButton(blackText: blackText, blueText: blueText))
    }
}
