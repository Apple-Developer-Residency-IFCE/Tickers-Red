//
//  ConfirmButton.swift
//  Tickers
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct ConfirmButton: View {
    var text: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 214, height: 41.5)
                .foregroundColor(.blue)
            Text(text)
                .foregroundColor(.white)
                .bold()
        }
    }
}

struct ConfirmButton_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmButton(text: "Pular pausa")
    }
}
