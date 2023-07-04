//
//  AchievementsCardView.swift
//  Tickers
//
//  Created by Alley Pereira on 28/06/23.
//

import SwiftUI

//struct VerTudoBntView: View {
//    var body: some View {
//        Button("Ver tudo") {
//
//        }
//    }
//}

//struct VerTudoBntView_Previews: PreviewProvider {
//    static var previews: some View {
//        VerTudoBntView()
//    }
//}

struct AchievementsCardView: View {
    
    let titleAchievement: String
    let descriptionAchievement: String
    
    init(titleAchievement: String, descriptionAchievement: String) {
        self.titleAchievement = titleAchievement
        self.descriptionAchievement = descriptionAchievement
    }
    
    var body: some View {
        Image("")
        Text(titleAchievement).tickerFont(size: 14, weight: .bold)
        Text(descriptionAchievement).tickerFont(size: 12, weight: .bold)
    }
}

struct AchievementsCardView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsCardView(titleAchievement: "Hora do Foco", descriptionAchievement: "Concluiu seu primeiro Pomodoro.")
    }
}
