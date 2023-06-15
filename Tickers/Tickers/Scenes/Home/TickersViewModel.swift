//
//  SwiftUIView.swift
//  Tickers
//
//  Created by Ian Pacini on 15/06/23.
//

import SwiftUI



class tickersViewModel: ObservableObject {
    
    @Published var tickers = Tickers(tickers:
                                        [Ticker(isLocked: false, actualProgress: 29, totalProgress: 30, tickerLevel: 1, tickerImage: "babyCatAwake", tickerEgg: "blueEgg", tickerName: "Joaozinho"),
                                         Ticker(isLocked: true, actualProgress: 0, totalProgress: 1, tickerLevel: 0, tickerImage: "babyCatAwake", tickerEgg: "blueEgg", tickerName: "Caiozinho"),
                                         Ticker(isLocked: true, actualProgress: 0, totalProgress: 1, tickerLevel: 0, tickerImage: "babyCatAwake", tickerEgg: "redEgg", tickerName: "Lucaszinho"),
                                         Ticker(isLocked: true, actualProgress: 0, totalProgress: 1, tickerLevel: 0, tickerImage: "babyCatAwake", tickerEgg: "yellowEgg", tickerName: "Julinha"),
                                         Ticker(isLocked: true, actualProgress: 0, totalProgress: 1, tickerLevel: 0, tickerImage: "babyCatAwake", tickerEgg: "greenEgg", tickerName: "Aleeyzinha"),
                                         Ticker(isLocked: true, actualProgress: 0, totalProgress: 1, tickerLevel: 0, tickerImage: "babyCatAwake", tickerEgg: "pinkEgg", tickerName: "Vanessinha")])
    
}

