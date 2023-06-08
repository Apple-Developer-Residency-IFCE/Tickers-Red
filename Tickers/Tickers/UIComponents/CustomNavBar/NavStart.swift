//
//  NavStart.swift
//  Tickers
//
//  Created by Ian Pacini on 07/06/23.
//

import SwiftUI

struct NavStart: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                CustomNavBar()
            } label: {
                Text("Click me")
            }
        }
    }
}

struct NavStart_Previews: PreviewProvider {
    static var previews: some View {
        NavStart()
    }
}
