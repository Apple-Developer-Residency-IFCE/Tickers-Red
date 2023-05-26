//
//  BackoutButton.swift
//  Tickers
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct BackoutButton: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .stroke(.blue, lineWidth: 3.5)
                .frame(width: 214, height: 41.5)
                .foregroundColor(.clear)
            Text("Nao, me leve de volta")
                .foregroundColor(.blue)
                .bold()
        }
    }
}

struct BackoutButton_Previews: PreviewProvider {
    static var previews: some View {
        BackoutButton()
    }
}
