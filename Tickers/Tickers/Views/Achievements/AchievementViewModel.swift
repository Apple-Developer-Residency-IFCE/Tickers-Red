//
//  AchievementViewModel.swift
//  Tickers
//
//  Created by Rebeca Rodrigues on 19/07/23.
//

import SwiftUI
import CoreData

class AchievementViewModel: ObservableObject {
    
    @Published var achievement: [Achievement] = []
    
    private let coreDataViewModel: CoreDataViewModel<Achievement>
    
    init(coreDataViewModel: CoreDataViewModel<Achievement>) {
        self.coreDataViewModel = coreDataViewModel
    }
    
    func loadAchievement() {
        let fetchRequest: NSFetchRequest<Achievement> = Achievement.fetchRequest()
        guard let fetchedAchievement = try? coreDataViewModel.viewContext.fetch(fetchRequest) else {
            return
        }
        achievement = fetchedAchievement
    }
    
    func createAchievement(id: UUID, xpAtual: Float, xpTotal: Float, isCompleted: Bool) {
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
    
}
