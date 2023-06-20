//
//  ConfirmButton.swift
//  Tickers
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct ConfirmBtn: View {
    var text: String
    var filled: Bool
    var sizeTextBtn: Int = 24

    var action: () -> Void
    
    var body: some View {
        ZStack{
            Text(text)
                .tickerFont(size: CGFloat(sizeTextBtn), weight: .bold)
                .padding([.bottom, .top], 11)
                .padding([.leading, .trailing], 20)
                .frame(maxWidth: .infinity)
                .background{
                    rectangleBuilder(filled: filled)
                }
                .foregroundColor(filled ? .white :.blue)
        }
        .onTapGesture {
            action()
        }
    }
    
    @ViewBuilder func rectangleBuilder(filled: Bool) -> some View{
        if filled {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.blue)
        } else {
            RoundedRectangle(cornerRadius: 15)
                .stroke(.blue, lineWidth: 3.5)
                .foregroundColor(.clear)
        }
    }
    
}

struct ConfirmBtn_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmBtn(text: "Pular pomodoro", filled: false) {
            print("Do something!")
        }
    }
}
