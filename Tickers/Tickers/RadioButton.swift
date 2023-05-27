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
            isSelected = true
        }) {
            HStack {
                Image(isSelected ? "Checkbox" : "Uncheck")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(title)
                    .foregroundColor(.black)
            }
        }
    }
}

struct RadioButton: View {
    @State private var selectedOption: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            OptionButton(title: "Claro", isSelected: Binding(
                get: { self.selectedOption == "Opção 1" },
                set: { newValue in
                    if newValue {
                        self.selectedOption = "Opção 1"
                    }
                }
            ))
            
            Spacer()
                .frame(height: 6)
            
            OptionButton(title: "Escuro", isSelected: Binding(
                get: { self.selectedOption == "Opção 2" },
                set: { newValue in
                    if newValue {
                        self.selectedOption = "Opção 2"
                    }
                }
            ))
        }
    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        RadioButton()
    }
}
