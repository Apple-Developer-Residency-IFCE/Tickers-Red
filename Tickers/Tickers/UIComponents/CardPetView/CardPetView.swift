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
    var tickerEgg: String
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("White"))
                .frame(width: 160, height: 176)
                .overlay {
                    cardPet(isLocked:true)
                }
        }
    }
    
    @ViewBuilder func cardPet(isLocked: Bool) -> some View {
        if isLocked {
            ZStack {
                Image(tickerEgg)
                Image("padlock")
                    .offset(x: 55, y: 60)
            }
        } else {
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

struct CardPetView_Previews: PreviewProvider {
    static var previews: some View {
        
        CardPetView(isLocked: true, actualProgress: 1, totalProgress: 1, tickerName: "Ticker", tickerLevel: 1, tickerImage: "babyCatAwake", tickerEgg: "eggPink")
    }
}
