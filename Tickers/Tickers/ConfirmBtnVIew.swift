//
//  SumButtons.swift
//  Tickers
//
//  Created by userext on 26/05/23.
//

import SwiftUI

struct ConfirmBtnView: View {
    var confirmBtnText: String
    
    var body: some View {
        VStack{
            ZStack{
                Text(confirmBtnText)
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
            
            ZStack{
                Text("Nao, me leve de volta")
                    .padding([.bottom, .top], 11)
                    .padding([.leading, .trailing], 20)
                    .background{
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.blue, lineWidth: 3.5)
                            .foregroundColor(.clear)
                    }
                    .foregroundColor(.blue)
                    .bold()
            }
            .onTapGesture {
                print("dosomething?")
            }
        }
    }
}

struct ConfirmBtnView_previews: PreviewProvider {
    static var previews: some View {
        ConfirmBtnView(confirmBtnText: "Pular pomodoro")
    }
}
