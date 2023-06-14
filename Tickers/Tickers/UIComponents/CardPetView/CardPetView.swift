//
//  CardPetView.swift
//  Tickers
//
//  Created by Ian Pacini on 07/06/23.
//

import SwiftUI

struct CardPetView: View {
    var isLocked:Bool
    
    var actualProgress: Int
    var totalProgress: Int
    @State var tickerName: String
    var tickerLevel: Int
    var tickerImage: String
    
    var body: some View {
        VStack{
            if(!isLocked){
                TickerView(actualProgress: actualProgress,
                           totalProgress: totalProgress,
                           tickerName: tickerName,
                           tickerLevel: tickerLevel,
                           tickerImage: tickerImage)
            }else {
                EggLockView(tickerImage: tickerImage)
            }
        }
    }
}

struct CardPetView_Previews: PreviewProvider {
    static var previews: some View {
        //Card do Ticker
        CardPetView(isLocked: false, actualProgress: 10, totalProgress: 20, tickerName: "Ticker", tickerLevel: 21, tickerImage: "babyCatAwake")
        
        //Card do Egg
        CardPetView(isLocked: true, actualProgress: 0, totalProgress: 0, tickerName: "", tickerLevel: 0, tickerImage: "eggPink")
    }
}
