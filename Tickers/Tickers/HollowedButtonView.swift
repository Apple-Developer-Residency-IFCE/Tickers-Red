//
//  BackoutButton.swift
//  Tickers
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct HollowButton: View {
    var text: String
    
    var body: some View {
        ZStack{
            Text(text)
                .tickerFont(size: 24, weight: .bold)
                .padding([.bottom, .top], 11)
                .padding([.leading, .trailing], 20)
                .background{
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.blue, lineWidth: 3.5)
                        .foregroundColor(.clear)
                }
                .foregroundColor(.blue)
        }
        .onTapGesture {
            print("dosomething?")
        }
    }
}

struct HollowButton_Previews: PreviewProvider {
    static var previews: some View {
        HollowButton(text: "Nao, me leve de volta")
    }
}


