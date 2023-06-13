//
//  tickerFont.swift
//  Tickers
//
//  Created by userext on 24/05/23.
//

import Foundation
import SwiftUI

enum TickerFontWeight: String {
    case regular = "Nunito-Regular"
    case bold = "Nunito-Bold"
}

extension View {
    func tickerFont(size: CGFloat, weight: TickerFontWeight) -> some View {
        return self.font(.custom(weight.rawValue, size: size))
    }
}
