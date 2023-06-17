//
//  ProfileView.swift
//  Tickers
//
//  Created by Oliver Santos on 15/06/23.
//

import SwiftUI

struct radion {
    var isSelected: Bool
}

struct ProfileView: View {
    @State private var name = ""
    @State private var listRadion: [radion] = [radion(isSelected: true), radion(isSelected: false), radion(isSelected: false)]
    
    
    func updateBools(selectedBool: inout Bool, bool1: inout Bool, bool2: inout Bool) {
        if selectedBool {
            bool1 = false
            bool2 = false
        }
    }
    
    func updateBools(selectedIndex: Int, bools: inout [Bool]) {
        for index in 0..<bools.count {
            if index == selectedIndex {
                bools[index] = true
            } else {
                bools[index] = false
            }
        }
    }
    
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
            Text("Modo Escuro").tickerFont(size: 20, weight: .bold).foregroundColor(.blue)
            Text("Altera a aparência do app para o modo escolhido").tickerFont(size: 13, weight: .regular)
            OptionButton(title: "Claro", isSelected: $listRadion[0].isSelected)
            OptionButton(title: "Escuro", isSelected: $listRadion[1].isSelected)
            OptionButton(title: "Seguir o padrão do Sistema", isSelected: $listRadion[2].isSelected)
        }.padding(.horizontal ,30).padding(.vertical, 12)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
