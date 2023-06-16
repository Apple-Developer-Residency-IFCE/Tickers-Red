//
//  ProgressBarView.swift
//  Tickers
//
//  Created by João Lucas G. on 13/06/23.
//

import SwiftUI

struct ProgressBarView: View {
    let actualProgress: Int
    let totalProgress: Int
    init(actualProgress: Int,totalProgress: Int) {
        self.actualProgress = actualProgress
        self.totalProgress = totalProgress
    }
    
    var body: some View {
        HStack {
            Image("levelUpClock")
            ProgressView(value: Double(actualProgress), total: Double (totalProgress))
                .frame(width: 55)
            Text("\(actualProgress)/\(totalProgress)")
                .tickerFont(size: 12, weight: .bold)
                .foregroundColor(Color("Grey3"))
            
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(actualProgress: 1, totalProgress: 2)
    }
}
