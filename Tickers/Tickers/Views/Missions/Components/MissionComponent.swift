//
//  CellView.swift
//  Tickers
//
//  Created by userext on 29/05/23.
//

import SwiftUI

struct MissionComponent: View {
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
                    .foregroundColor(Color("AchievCompleted"))
                
                Text(description).tickerFont(size: 14, weight: .regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, trailingPadding)
                    .foregroundColor(Color("AchievCompleted"))
                
                HStack{
                    ProgressView(value: Float(taskResolved)/Float(taskTotal))
                        .tint(color)
                        .background(color.opacity(0.4))
                        .frame(height: 10)
                        .scaleEffect(y: 1.5)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                    
                    Text("\(taskResolved)/\(taskTotal)").tickerFont(size: 12, weight: .regular)
                        .frame(alignment: .leading)
                        .foregroundColor(Color("AchievCompleted"))
                        .padding(.trailing, trailingPadding)
                }
            }
            .padding(generalPadding)
        }
        .background{
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(Color("ContainerColor"))
        }
    }
}

struct MissionComponent_Previews: PreviewProvider {
    static var previews: some View {
        MissionComponent(taskTotal: 2, taskResolved: 1, color: .init("Salmon"), title: "Seilaman", description: "seilacarai faz ai a task kjkjkjkjkjkjkjkj")
    }
}
