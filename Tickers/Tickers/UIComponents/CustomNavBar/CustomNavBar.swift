//
//  CustomNavBar.swift
//  Tickers
//
//  Created by Ian Pacini on 07/06/23.
//

import SwiftUI

struct CustomNavBar: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Image("babyCatAsleepTimer")
        }
//        .navBarMainScreen()
        .navigationTitle("Babycat!")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("returnArrow")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    Text("go to missions lesgo")
                } label: {
                    Image("missions")
                }
            }
        }
    }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar()
    }
}
