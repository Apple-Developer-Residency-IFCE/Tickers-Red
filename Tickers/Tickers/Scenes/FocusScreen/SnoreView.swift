//
//  SnoreView.swift
//  Tickers
//
//  Created by Alley Pereira on 13/06/23.
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
