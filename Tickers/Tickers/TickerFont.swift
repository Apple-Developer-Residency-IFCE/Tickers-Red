//
//  tickerFont.swift
//  Tickers
//
//  Created by userext on 24/05/23.
//

import Foundation
import SwiftUI


extension Text {
    func tickerFontRegular(size: CGFloat) -> Text {
        self.font(.custom("Nunito-Regular", size: size))
    }
    func tickerFontBold(size: CGFloat) -> Text {
        self.font(.custom("Nunito-Bold", size: size))
    }
}
