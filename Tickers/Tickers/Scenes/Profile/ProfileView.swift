//
//  ProfileView.swift
//  Tickers
//
//  Created by Oliver Santos on 15/06/23.
//

import SwiftUI


struct ProfileView: View {
    @State private var name = ""
    @State private var showingSounds = false
    @State private var buttonIsHidden = false
    @State private var selectedOption: String?
    
    let options = ["Claro", "Escuro", "Seguir o padrão do Sistema"]
    
    var body: some View {
        VStack(alignment: .leading) {
            title
            Divider()
            your_name
            Divider()
            theme
            Divider()
            Spacer()
        }.padding(.top, 20)
    }
    
    private var title: some View {
        VStack {
            Text("Perfil e Preferência").tickerFont(size: 22, weight: .bold)
        }.padding(.leading, 30).padding(.trailing, 30)
    }
    
    private var your_name: some View {
        VStack(alignment: .leading)  {
            Text("Seu nome").tickerFont(size: 20, weight: .bold).foregroundColor(.blue)
            Text("Define como os Tickers chamarão você").tickerFont(size: 13, weight: .regular)
            CustomTextField(text: $name, placeholder: "Escreva aqui seu nome.", font: .bold, fontSize: 16).padding(.bottom, 15)
        }.padding(.leading, 30).padding(.trailing, 30).padding(.top, 12)
    }
    
    private var theme: some View {
        VStack(alignment: .leading) {
            Text("Temas").tickerFont(size: 20, weight: .bold).foregroundColor(.blue)
            Text("Altera a aparência do app para o modo escolhido").tickerFont(size: 13, weight: .regular)
            ForEach(options, id: \.self) { option in
                OptionButton(title: option, isSelected: self.binding(for: option))
                    .onTapGesture {
                        selectedOption = option
                    }
            } //: ForEach
        }.padding(.horizontal ,30).padding(.vertical, 12)
    }
    
    
    private func binding(for option: String) -> Binding<Bool> {
        Binding<Bool>(
            get: { self.selectedOption == option },
            set: { newValue in
                if newValue {
                    self.selectedOption = option
                } else if self.selectedOption == option {
                    self.selectedOption = nil
                }
            }
        )
    }//: func
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
