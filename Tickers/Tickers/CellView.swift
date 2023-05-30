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
            VStack(spacing: 0){
                Text("Primeira vez").tickerFont(size: 16, weight: .bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Finalize o seu primeiro pomodoro do dia e ganhe 50 de xp.").tickerFont(size: 14, weight: .regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, 20)
                HStack{
                    ProgressView(value: progress).frame(maxWidth: .infinity).padding(.trailing, 5)
                    Text("0/1").tickerFont(size: 12, weight: .regular)
                        .frame(alignment: .leading)
                        .padding(.trailing, 20)
                }
            }
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
    }
}
