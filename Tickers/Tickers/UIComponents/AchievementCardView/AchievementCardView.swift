//
//  AchievementCardView.swift
//  Tickers
//
//  Created by Julia Morales on 29/06/23.
//

import SwiftUI

struct AchievementCardView: View {
    let isCompleted: Bool
    let isProgressive: Bool
    let taskTotal: Int
    let taskResolved: Int
    let title: String
    let description: String
    
    private let leadingPadding: CGFloat = 15
    private let trailingPadding: CGFloat = 20
    private let generalPadding: CGFloat = 5
    private let cornerRadius: CGFloat = 20
    
    var body: some View {
        HStack{
            ZStack{
                isCompleted ? Image("trophyUnlocked") : Image("trophyLocked")
            }
                .padding(.leading, leadingPadding)
            
            VStack(spacing: 0){
                Text(title).tickerFont(size: 16, weight: .bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(isCompleted ? Color("AchievCompleted") : Color("AchievIncompleted"))
                
                Text(description).tickerFont(size: 14, weight: .regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, trailingPadding)
                    .foregroundColor(isCompleted ? Color("AchievCompleted") : Color("AchievIncompleted"))
                
                if isProgressive && !isCompleted {
                    ProgressBarAchievement(taskTotal: taskTotal, taskResolved: taskResolved)
                }
            }
            .padding(generalPadding)
        }
        .background{
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(width: 355, height: 88)
                .foregroundColor(isCompleted ? Color("trophyUnlocked") : Color("trophyLocked"))
        }
    }
}

struct AchievementCardView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementCardView(isCompleted: false, isProgressive: true, taskTotal: 5, taskResolved: 1, title: "Hora do Foco", description: "Completou um total de 5 horas em foco")
    }
}

