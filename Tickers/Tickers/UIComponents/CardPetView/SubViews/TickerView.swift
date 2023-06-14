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
    
    init(actualProgress: Int = 1, totalProgress: Int = 2, tickerName: String = "", tickerLevel: Int = 21, tickerImage: String = "babyCatAwake") {
        self.actualProgress = actualProgress
        self.totalProgress = totalProgress
        self.tickerName = tickerName
        self.tickerLevel = tickerLevel
        self.tickerImage = tickerImage
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color("White"))
            .frame(width: 160, height: 176)
            .overlay {
                VStack {
                    HStack {
                        Text(tickerName)
                            .font(.custom("Nunito-Bold", size: 12))
                            .foregroundColor(Color("Blue2"))
                        Image("pencilWhite")
                            .padding([.leading], -4)
                    }
                    .padding([.top], 10)
                    .padding([.leading], 4.5)
                    
                    Spacer()
                        .frame(height: 0)
                    
                    Image(tickerImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 105, height: 100)
                        .padding([.leading], 17)
                    
                    Spacer()
                        .frame(height: 1)
                    
                    HStack{
                        Text("Lvl.")
                            .font(.custom("Nunito-Bold", size: 12))
                            .foregroundColor(Color("MainBlue"))
                        
                        Spacer()
                            .frame(width: 1)
                        
                        Text(String(tickerLevel))
                            .font(.custom("Nunito-Bold", size: 12))
                    }
                    .foregroundColor(Color("MainBlue"))
                    
                    Spacer()
                        .frame(height: 1)
                    
                    ProgressBarView(actualProgress: actualProgress, totalProgress: totalProgress)
                        .padding([.bottom], 6)
                }
            }
    }
}


struct TickerView_Previews: PreviewProvider {
    static var previews: some View {
        TickerView()
    }
}
