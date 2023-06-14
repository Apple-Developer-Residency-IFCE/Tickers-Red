//
//  EggLockView.swift
//  Tickers
//
//  Created by João Lucas G. on 13/06/23.
//

import SwiftUI

struct EggLockView: View {
    var tickerImage: String = "eggPink"
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color("White"))
            .frame(width: 160, height: 176)
            .overlay {
                ZStack {
                    Image(tickerImage)
                    Image("padlock")
                        .offset(x: 55, y: 60)
                }
            }
    }
}

struct EggLockView_Previews: PreviewProvider {
    static var previews: some View {
        EggLockView()
    }
}
