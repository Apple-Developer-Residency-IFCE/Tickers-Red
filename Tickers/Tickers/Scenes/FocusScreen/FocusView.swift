//
//  FocusView.swift
//  Tickers
//
//  Created by Ian Pacini on 07/06/23.
//

import SwiftUI

struct SnoreView: View {
    var body: some View {
        HStack {
            VStack {
                Image("snore(1)")
                Image("snore(3)")
            }
            ZStack {
                Image("snore(2)")
            }
        }
    }
}

struct FocusView: View {
    var body: some View {
        VStack {
            // Chamar a extension TimeInterval aq
            SnoreView()
            Image("babyCatAsleepFocus")
        }
    }
}

struct FocusView_Previews: PreviewProvider {
    static var previews: some View {
        FocusView()
    }
}
