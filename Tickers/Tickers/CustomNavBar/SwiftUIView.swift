//
//  CustomNavBarView.swift
//  Tickers
//
//  Created by userext on 29/05/23.
//

import SwiftUI

struct CustomNavBar: View {
    @State var showReturnButton: Bool = true
    @State var textBlack: String = ""
    @State var textBlue: String = ""
    
    var body: some View {
        VStack {
            HStack {
                if showReturnButton {
                    returnButton
                }
                Spacer()
                Text(textBlack)
                    .tickerFont(size: 24, weight: .bold)
                Text(textBlue)
                    .tickerFont(size: 24, weight: .bold)
                    .foregroundColor(.blue)
                Spacer()
                if showReturnButton {
                    returnButton
                        .opacity(0)
                }
                
                content
            }
            .padding(10)
            Divider()
            Spacer()
        }
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar(showReturnButton: true,)
    }
}

extension CustomNavBar {
    
    private var returnButton: some View {
        Button(action: {
            
        }, label: {
            Image("returnArrow")
        })
    }
}
