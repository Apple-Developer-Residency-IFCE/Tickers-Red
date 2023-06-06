//
//  CustomNavLink.swift
//  Tickers
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct CustomNavLink<Label: View, Destination: View>: View {
    
    let destination: Destination
    let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        VStack {
            NavigationLink {
                NavScreenWBarView {
                    destination
                }
                .navigationBarHidden(true)
            } label: {
                label
            }
        }
    }
}

struct CustomNavLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView {
            CustomNavLink(destination: Text("Destino")) {
                Text("ClicaNIMIM")
            }
        }
    }
}
