//
//  CellView.swift
//  Tickers
//
//  Created by userext on 29/05/23.
//

import SwiftUI

struct CellView: View {
    @State private var progress: Float = 0.5
    var body: some View {
        HStack{
            Image("challengeBlue").padding(.leading, 15)
            VStack{
                Text("Primeira vez").tickerFont(size: 20, weight: .bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Finalize o seu primeiro pomodoro do dia e ganhe 50 de xp.").tickerFont(size: 14, weight: .regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, 20)
                ProgressView(value: progress).frame(maxWidth: .infinity).padding(.trailing, 30)
            }
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
    }
}
