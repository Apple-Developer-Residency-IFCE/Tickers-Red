//
//  RadioButton.swift
//  Tickers
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct OptionButton: View {
    let title: String
    @Binding var isSelected: Bool
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            HStack {
                Image(isSelected ? "Checkbox" : "Uncheck")
                Text(title)
                    .foregroundColor(.black)
            }
        }
    }
}

struct OptionButton_Previews: PreviewProvider {
    static var previews: some View {
        OptionButton(title: "RadioButton", isSelected: .constant(false))
        
    }
}
