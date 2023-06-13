//
//  ProgressBarView.swift
//  Tickers
//
//  Created by João Lucas G. on 13/06/23.
//

import SwiftUI

struct ProgressBarView: View {
    var actualProgress: Int
    var totalProgress: Int
    init(_ actualProgress: Int,_ totalProgress: Int) {
        self.actualProgress = actualProgress
        self.totalProgress = totalProgress
    }
    
    var body: some View {
        HStack {
            Image("levelUpClock")
            ProgressView(value: Double(actualProgress), total: Double (totalProgress))
                .frame(width: 68)
            Text("\(actualProgress)/\(totalProgress)")
                .font(.custom("Nunito-Bold", size: 12))
                .foregroundColor(Color("Grey3"))
            
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(1, 2)
    }
}
