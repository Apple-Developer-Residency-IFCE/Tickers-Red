//
//  AchievementCardsView.swift
//  Tickers
//
//  Created by Rebeca Rodrigues on 28/06/23.
//

import SwiftUI

struct AchievementCardsView: View {
    
    let isLocked :Bool
    let title :String
    let subTitle :String
    
    var body: some View {
        
        VStack {
            AchievementCard(isLocked: isLocked)
        }
    }
    
    @ViewBuilder func AchievementCard (isLocked :Bool) -> some View {
        if isLocked {
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("AchievLockCard"))
                    .frame(width: 143, height: 173)
                    .overlay {
                        
                        VStack {
                            Image("trophyLocked")
                            
                            Spacer()
                                .frame(height: 0)
                            
                            Text(title)
                                .tickerFont(size: 14, weight: .bold)
                            Text(subTitle)
                                .tickerFont(size: 12, weight: .bold)
                                .multilineTextAlignment(.center)
                    }
                    .padding(.bottom, 10)
                }
            }
            
            
        } else {
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("AchievUnlockCard"))
                    .frame(width: 143, height: 173)
                    .overlay {
                        VStack {
                            Image("trophyUnlocked")
                            
                            Spacer()
                                .frame(height: 0)
                            
                            Text(title)
                                .tickerFont(size: 12, weight: .bold)
                            Text(subTitle)
                                .tickerFont(size: 10, weight: .regular)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 16)
                }
            }
        }
    }
}


struct AchievementCardsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementCardsView(isLocked: true, title: "Hora do Foco", subTitle: "Concluiu seu primeiro Pomodoro")
    }
}
