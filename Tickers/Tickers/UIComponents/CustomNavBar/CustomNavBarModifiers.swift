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
                        Text(blueText).tickerFont(size: 20, weight: .bold)
                            .foregroundColor(.blue)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        MissionsView(missionsViewModel: MissionsViewModel())
                    } label: {
                        Image("missions")
                    }
                }
            }
            .padding(.top, 18)
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
                        Text(blueText).tickerFont(size: 20, weight: .bold)
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.top, 18)
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
