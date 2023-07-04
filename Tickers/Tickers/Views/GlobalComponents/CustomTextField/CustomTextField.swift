//
//  CustomTextField.swift
//  Tickers
//
//  Created by Alley Pereira on 01/06/23.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    
    let placeholder: String
    let font: TickerFontWeight
    let fontSize: CGFloat
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .padding()
                .background(RoundedRectangle(cornerRadius: 22).stroke(Color(red: 203 / 255, green: 200 / 255, blue: 200 / 255), lineWidth: 0.6))
                .foregroundColor(Color("AchievCompleted"))
                .tickerFont(size: fontSize, weight: font)
        }
    }
}

// MARK: - Struct for Test the behavior
struct CustomTextField_Previews: PreviewProvider {
    
    struct ContentTest: View {
        @State private var name = ""
        
        var body: some View {
            CustomTextField(text: $name, placeholder: "Escreva aqui seu nome.", font: .bold, fontSize: 16)
        }
    }
    
    @State private var name = ""
    static var previews: some View {
        ContentTest()
            .previewDevice("iPhone 13 mini")
    }
}
