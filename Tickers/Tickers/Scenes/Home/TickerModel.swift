//
//  TickerModel.swift
//  Tickers
//
//  Created by Ian Pacini on 15/06/23.
//

import SwiftUI

struct Ticker: Identifiable {
    var id: Int
    var isLocked: Bool
    var actualProgress: Int
    var totalProgress: Int
    var tickerLevel: Int
    var tickerImage: String
    var tickerEgg: String
    var tickerName: String
}

struct Tickers {
    var tickers: [Ticker]
}
