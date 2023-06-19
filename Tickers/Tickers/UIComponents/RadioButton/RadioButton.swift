//
//  RadioButton.swift
//  Tickers
//
//  Created by userext on 25/05/23.
//

import SwiftUI


struct OptionButton: View {
    let title: String
    private let updateBools: () -> Void
    @Binding var isSelected: Bool
    
    init(title: String, updateBools: @escaping () -> Void, isSelected: Bool) {
        self.title = title
        self.updateBools = updateBools
        self.isSelected = isSelected
    }
    
    var body: some View {
        VStack {
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
}

struct OptionButton_Previews: PreviewProvider {
    static var previews: some View {
        OptionButton(title: "teste", isSelected: .constant(true), updateBools: () -> Void)
        
    }
}
