//
//  SliderView.swift
//  Tickers
//
//  Created by Ian Pacini on 23/06/23.
//

import SwiftUI

struct SliderView: View {
    @Binding var valorAtual: Float
    let step: Float = 1
    let title: String = ""
    let minValue: Float = 0
    let maxValue: Float = 1
    let valueType: String = ""


    var body: some View {
        VStack(spacing: -20) {
            HStack{
                Text(title)
                    .tickerFont(size: 20, weight: .bold)
                Spacer()
            }
            .padding(.leading, 30)
            Slider(
                value: $valorAtual,
                in: minValue...maxValue,
                step: step
            ) {
                } minimumValueLabel: {
                    Button {
                        self.valorAtual-=step
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color("Blue2"))
                    }
                    .scaleEffect(x: 1.5, y: 1.5)
                    
                } maximumValueLabel: {
                    Button {
                        self.valorAtual+=step
                    } label: {
                        Image(systemName: "chevron.forward")
                            .foregroundColor(Color("Blue2"))
                    }
                    .scaleEffect(x: 1.5, y: 1.5)
                }
                .padding(25)
                .tint(Color("Blue2"))
            HStack{
                Text("\(Int(minValue))\(valueType)")
                    .foregroundColor(.gray)
                    .tickerFont(size: 17, weight: .regular)
                Spacer()
                Text("\(Int(valorAtual))\(valueType)")
                    .foregroundColor(Color("Blue2"))
                    .tickerFont(size: 17, weight: .regular)
                Spacer()
                Text("\(Int(maxValue))\(valueType)")
                    .foregroundColor(.gray)
                    .tickerFont(size: 17, weight: .regular)
            }
            .padding([.leading,. trailing], 50)
        }
    }
}
