//
//  CellView.swift
//  Tickers
//
//  Created by userext on 29/05/23.
//

import SwiftUI

struct CellView: View {
    var qtdTask: Int
    var taskResolved: Int
    var image: String = "challengeBlue"
    var title: String
    var description: String
    
    
    var body: some View {
        HStack{
            Image("\(image)").padding(.leading, 15)
            VStack(spacing: 0){
                Text("\(title)").tickerFont(size: 16, weight: .bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(description)").tickerFont(size: 14, weight: .regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, 20)
                HStack{
                    ProgressView(value: Float(taskResolved)/Float(qtdTask)).frame(maxWidth: .infinity).padding(.trailing, 5)
                    Text("\(taskResolved)/\(qtdTask)").tickerFont(size: 12, weight: .regular)
                        .frame(alignment: .leading)
                        .padding(.trailing, 20)
                }
            }.padding(5)
        }.cornerRadius(20)
    }
}

