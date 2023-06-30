//
//  ProgressBarAchievement.swift
//  Tickers
//
//  Created by Julia Morales on 29/06/23.
//

import SwiftUI

struct ProgressBarAchievement: View {
    let taskTotal: Int
    let taskResolved: Int
    
    var body: some View {
        HStack{
            ProgressView(value: Float(taskResolved)/Float(taskTotal))
                .background(Color("BlueProgressBar"))
                .frame(height: 10)
                .scaleEffect(y: 1.5)
                .clipShape(RoundedRectangle(cornerRadius: 100))
            
            Text("\(taskResolved)/\(taskTotal)").tickerFont(size: 12, weight: .regular)
                .frame(alignment: .leading)
                .foregroundColor(Color("AchievIncompleted"))
                .padding(.trailing, 20)
        }
    }
}

struct ProgressBarAchievement_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarAchievement(taskTotal: 5, taskResolved: 1)
    }
}
