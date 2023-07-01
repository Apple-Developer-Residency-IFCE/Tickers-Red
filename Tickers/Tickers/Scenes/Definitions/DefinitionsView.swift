//
//  DefinitionsView.swift
//  Tickers
//
//  Created by Ian Pacini on 23/06/23.
//

import SwiftUI

struct DefinitionsView: View {
    @State var tempoPomodoro: Float = 0
    @State var descansoCurto: Float = 0
    @State var descansoLongo: Float = 0
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 16){
                HStack{
                    Image("hourglassWPencil")
                    Text("Definições")
                        .tickerFont(size: 18, weight: .bold)
                        .foregroundColor(.customBlue)
                    Spacer()
                    Image("exitGray")
                        .onTapGesture {
                            dismiss()
                        }.padding(.trailing, 30)
                }.padding(.leading, 30)
                Divider()
                SliderView(valorAtual: $tempoPomodoro, title: "Tempo por pomodoro", minValue: 15, maxValue: 50, valueType: "min")
                SliderView(valorAtual: $descansoCurto, title: "Descanso Curto", minValue: 4, maxValue: 10, valueType: "min")
                SliderView(valorAtual: $descansoLongo, title: "Descanso Longo", minValue: 15, maxValue: 30, valueType: "min")
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct DefinitionsView_Previews: PreviewProvider {
    static var previews: some View {
        DefinitionsView()
    }
}
