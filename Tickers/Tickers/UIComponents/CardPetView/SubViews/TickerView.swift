//
//  TickerView.swift
//  Tickers
//
//  Created by João Lucas G. on 13/06/23.
//

import SwiftUI

struct TickerView: View {
    var actualProgress: Int
    var totalProgress: Int
    @State var tickerName: String
    var tickerLevel: Int
    var tickerImage: String
    
    init(actualProgress: Int = 1, totalProgress: Int = 2, tickerName: String = "", tickerLevel: Int = 21, tickerImage: String = "") {
        self.actualProgress = actualProgress
        self.totalProgress = totalProgress
        self.tickerName = tickerName
        self.tickerLevel = tickerLevel
        self.tickerImage = tickerImage
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(tickerName)
                Image(tickerImage)
            }
        }
    }
}

struct TickerView_Previews: PreviewProvider {
    static var previews: some View {
        TickerView()
    }
}
