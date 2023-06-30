//
//  ProfileView.swift
//  Tickers
//
//  Created by Oliver Santos on 15/06/23.
//

import SwiftUI

enum Theme: String, CaseIterable {
    case light, dark, system
    
    var title: String {
        switch self {
        case .light:
            return "Claro"
        case .dark:
            return "Escuro"
        case .system:
            return "Seguir o padrão do Sistema"
        }
    }
    
    var toColorScheme: ColorScheme? {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return .none
        }
    }
}

struct ProfileView: View {
    @AppStorage("themeSelected") var themeSelected: Theme?
    @AppStorage("Name") var name: String = ""
    
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
            CustomTextField(text: $name, placeholder: "Escreva aqui seu nome.", font: .regular, fontSize: 16).padding(.bottom, 15)
        }.padding(.leading, 30).padding(.trailing, 30).padding(.top, 12)
    }
    
    private var theme: some View {
        VStack(alignment: .leading) {
            Text("Temas").tickerFont(size: 20, weight: .bold).foregroundColor(.blue)
            Text("Altera a aparência do app para o modo escolhido").tickerFont(size: 13, weight: .regular)
            ForEach(Theme.allCases, id: \.self) { option in
                OptionButton(title: option.title, isSelected: option == (themeSelected ?? .system))
//                    .onTapGesture {
//                        themeSelected = option
//                    }
            } //: ForEach
        }.padding(.horizontal ,30).padding(.vertical, 12)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
