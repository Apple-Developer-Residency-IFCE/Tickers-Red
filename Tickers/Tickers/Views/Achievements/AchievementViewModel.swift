//
//  AchievementViewModel.swift
//  Tickers
//
//  Created by Rebeca Rodrigues on 19/07/23.
//

import SwiftUI
import CoreData

class AchievementViewModel: ObservableObject {
    
    @Published var achievements: [Achievement] = []
    
    private let coreDataViewModel: CoreDataViewModel<Achievement>
    
    init(coreDataViewModel: CoreDataViewModel<Achievement>) {
        self.coreDataViewModel = coreDataViewModel
    }
    
    func loadAchievement() {
        let fetchRequest: NSFetchRequest<Achievement> = Achievement.fetchRequest()
        guard let fetchedAchievement = try? coreDataViewModel.viewContext.fetch(fetchRequest) else {
            return
        }
        achievements = fetchedAchievement
    }
    
    func saveAchievement(id: UUID, xpAtual: Float, xpTotal: Float, isCompleted: Bool) {
        let newAchievement = Achievement(context: coreDataViewModel.viewContext)
        newAchievement.id = UUID()
        newAchievement.xpAtual = xpAtual
        newAchievement.xpTotal = xpTotal
        newAchievement.isCompleted = isCompleted
        do {
            try coreDataViewModel.viewContext.save()
            loadAchievement()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
        
    }
    
    func updateAchievement(achievement: Achievement, xpAtual: Float, xpTotal: Float, isCompleted: Bool) {
        achievement.id = achievement.id
        achievement.xpAtual = xpAtual
        achievement.xpTotal = xpTotal
        achievement.isCompleted = isCompleted
        do {
            try coreDataViewModel.viewContext.save()
            loadAchievement()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
        
    }
    
    // Atualiza o xpAtual ao final do pomodoro
    func updateXP(minutes: Int) {
        for achievement in achievements {
            // TODO: implementar a lógica para atualizar o xpAtual com base nos minutos do pomodoro
            // ex: se o user ganhar 1 XP por minuto, fazer: achievement.xpAtual += Float(minutes)
            print(achievement)
        }

        do {
            try coreDataViewModel.viewContext.save()
            loadAchievement()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }

    func checkAndUnlockAchievements() {
        let xpGained = achievements.reduce(0) { $0 + $1.xpAtual }
        let unlockedTickers = getUnlockedTickers(xpGained: Int(xpGained))

        // TODO: implementar a lógica para desbloquear as conquistas com base em unlockedTickers.. so ainda nao sei como
    }

    private func getUnlockedTickers(xpGained: Int) -> [String: Int] {
        let xpRequiredByLevels = [
            "Ticker 1": [1: 20, 2: 45],
            "Ticker 2": [1: 75, 2: 120],
            "Ticker 3": [1: 100, 2: 265],
            "Ticker 4": [1: 360, 2: 485],
            "Ticker 5": [1: 630, 2: 810],
            "Ticker 6": [1: 1020, 2: 1170]
        ]

        var unlockedTickers: [String: Int] = [:]

        for (tickerName, xpRequiredByLevel) in xpRequiredByLevels {
            let achievement = AchievementSystem.Achievement(tickerName: tickerName, xpRequiredByLevel: xpRequiredByLevel)
            let unlockedLevel = achievement.unlockedLevel(xp: xpGained)
            if unlockedLevel > 1 {
                unlockedTickers[tickerName] = unlockedLevel
            }
        }

        return unlockedTickers
    }
}
