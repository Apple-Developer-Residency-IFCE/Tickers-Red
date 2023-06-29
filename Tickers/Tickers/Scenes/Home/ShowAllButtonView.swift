//
//  ShowAllButtonView.swift
//  Tickers
//
//  Created by Alley Pereira on 28/06/23.
//

import SwiftUI

struct ShowAllButtonView: View {
    
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        HStack {
            Text(title)
                .tickerFont(size: 16, weight: .bold)
            Spacer()
            Button(action: {
                // Ação pro botão "Ver tudo"
            }) {
                Text("Ver tudo")
                    .tickerFont(size: 16, weight: .bold)
                    .foregroundColor(.blue)
            }
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
    }
}

// MARK: - PreviewProvider
struct VerTudoBntView_Previews: PreviewProvider {
    static var previews: some View {
        ShowAllButtonView(title: "Escolha um Ticker para cuidar")
    }
}
