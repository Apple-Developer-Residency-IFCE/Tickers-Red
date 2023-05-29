//
//  SwiftUIView.swift
//  Tickers
//
//  Created by userext on 26/05/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text("Hello")
            .padding(10)
            .background{
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.green)
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
