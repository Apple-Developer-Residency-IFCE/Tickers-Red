//
//  ConfirmButton.swift
//  Tickers
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct ConfirmBtn: View {
    var text: String
    
    var body: some View {
        ZStack{
            Text(text)
                .padding([.bottom, .top], 11)
                .padding([.leading, .trailing], 20)
                .background{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.blue)
                }
                .foregroundColor(.white)
                .bold()
        }
        .onTapGesture {
            print("dosomethingelse!")
        }
    }
}

struct ConfirmBtn_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmBtn(text: "Pular pomodoro")
    }
}
