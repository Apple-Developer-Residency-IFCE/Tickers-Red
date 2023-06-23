//
//  RadioButton.swift
//  Tickers
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct OptionButton: View {
    let title: String
    var isSelected: Bool
    
    var body: some View {
        HStack {
            Image(isSelected ? "Checkbox" : "Uncheck")
            Text(title)
                .foregroundColor(Color("TextColor"))
                .tickerFont(size: 16, weight: .regular)
        }
    }
}

struct OptionButton_Previews: PreviewProvider {
    static var previews: some View {
        OptionButton(title: "teste", isSelected: true)
        
    }
}
