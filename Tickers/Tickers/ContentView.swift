//
//  ContentView.swift
//  Tickers
//
//  Created by Lucas Oliveira on 23/05/23.
//

import SwiftUI

struct ContentView: View {
    var image = Image("babyCatAwake")
    var body: some View {
        VStack {
            image
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
