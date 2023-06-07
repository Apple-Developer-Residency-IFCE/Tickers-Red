//
//  CellView.swift
//  Tickers
//
//  Created by userext on 29/05/23.
//

import SwiftUI

struct CellView: View {
    let qtdTask: Int
    let taskResolved: Int
    var image: String = "challengeBlue"
    let title: String
    let description: String
    
    private let leadingPadding: CGFloat = 15
    private let trailingPadding: CGFloat = 20
    private let generalPadding: CGFloat = 5
    private let cornerRadius: CGFloat = 20
    
    var body: some View {
        HStack{
            Image(image).padding(.leading, leadingPadding)
            VStack(spacing: 0){
                Text(title).tickerFont(size: 16, weight: .bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(description).tickerFont(size: 14, weight: .regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, trailingPadding)
                HStack{
                    ProgressView(value: Float(taskResolved)/Float(qtdTask))
                        .frame(maxWidth: .infinity)
                        .padding(.trailing, generalPadding)
                    Text("\(taskResolved)/\(qtdTask)").tickerFont(size: 12, weight: .regular)
                        .frame(alignment: .leading)
                        .padding(.trailing, trailingPadding)
                }
            }.padding(generalPadding)
        }.cornerRadius(cornerRadius)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(qtdTask: 2, taskResolved: 1, image: "challengePink", title: "Seilaman", description: "seilacarai faz ai a task")
    }
}
