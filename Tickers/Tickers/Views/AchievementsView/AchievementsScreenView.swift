//
//  AchivementsScreenView.swift
//  Tickers
//
//  Created by Julia Morales on 29/06/23.
//

import SwiftUI

struct AchievementsScreenView: View {
    @ObservedObject var achievementViewModel = AchievementMockDataModel()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                Divider()
                ScrollView{
                    ForEach(achievementViewModel.achievements, id: \.self) { achievement in
                        AchievementCardView(isCompleted: achievement.isCompleted , isProgressive: achievement.isProgressive, taskTotal: achievement.taskTotal, taskResolved: achievement.taskResolved, title: achievement.title, description: achievement.description)
                    }
                }
            }
            .navBarWithBackButton(blackText: "Conquistas")
        }.navigationBarBackButtonHidden(true)
    }
}

struct AchievementsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsScreenView()
    }
}
