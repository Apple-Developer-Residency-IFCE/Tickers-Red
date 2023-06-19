//
//  SwiftUIView.swift
//  Tickers
//
//  Created by Ian Pacini on 15/06/23.
//

import SwiftUI

class TickersViewModel: ObservableObject {
    @Published var tickers = Tickers(tickers:
                                        [Ticker(id: 1, isLocked: false, actualProgress: 29, totalProgress: 30, tickerLevel: 1, tickerImage: "babyCatAwake", tickerEgg: "eggBlue", tickerName: "Joaozinho"),
                                         Ticker(id: 2, isLocked: true, actualProgress: 0, totalProgress: 1, tickerLevel: 0, tickerImage: "babyCatAwake", tickerEgg: "eggBlue", tickerName: "Caiozinho"),
                                         Ticker(id: 3, isLocked: true, actualProgress: 0, totalProgress: 1, tickerLevel: 0, tickerImage: "babyCatAwake", tickerEgg: "eggRed", tickerName: "Lucaszinho"),
                                         Ticker(id: 4, isLocked: true, actualProgress: 0, totalProgress: 1, tickerLevel: 0, tickerImage: "babyCatAwake", tickerEgg: "eggYellow", tickerName: "Julinha"),
                                         Ticker(id: 5, isLocked: true, actualProgress: 0, totalProgress: 1, tickerLevel: 0, tickerImage: "babyCatAwake", tickerEgg: "eggGreen", tickerName: "Aleeyzinha"),
                                         Ticker(id: 6, isLocked: true, actualProgress: 0, totalProgress: 1, tickerLevel: 0, tickerImage: "babyCatAwake", tickerEgg: "eggPink", tickerName: "Vanessinha")])
}
