//
//  CellView.swift
//  Tickers
//
//  Created by userext on 29/05/23.
//

import SwiftUI

struct MissionCellView: View {
    let taskTotal: Int
    let taskResolved: Int
    var color: Color
    let title: String
    let description: String
    
    private let leadingPadding: CGFloat = 15
    private let trailingPadding: CGFloat = 20
    private let generalPadding: CGFloat = 5
    private let cornerRadius: CGFloat = 20
    
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 68, height: 68)
                    .foregroundColor(color)
                Image("medal")
                    .padding(.vertical, 19)
            }
                .padding(.leading, leadingPadding)
            
            VStack(spacing: 0){
                
                Text(title).tickerFont(size: 16, weight: .bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(description).tickerFont(size: 14, weight: .regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, trailingPadding)
                
                HStack{
                    
                    ProgressView(value: Float(taskResolved)/Float(taskTotal))
                        .tint(color)
                        .background(color.opacity(0.4))
                        .frame(height: 10)
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    
                    Text("\(taskResolved)/\(taskTotal)").tickerFont(size: 12, weight: .regular)
                        .frame(alignment: .leading)
                        .padding(.trailing, trailingPadding)
                }
            }
            .padding(generalPadding)
        }
        .background{
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(.white)
        }
    }
}

struct MissionCellView_Previews: PreviewProvider {
    static var previews: some View {
        MissionCellView(taskTotal: 2, taskResolved: 1, color: .init("Salmon"), title: "Seilaman", description: "seilacarai faz ai a task kjkjkjkjkjkjkjkj")
    }
}
