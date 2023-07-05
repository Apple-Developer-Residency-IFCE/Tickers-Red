//
//  CoreDataManager.swift
//  Tickers
//
//  Created by Alley Pereira on 05/07/23.
//

import Foundation
import CoreData

final class CoreDataManager {

    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    private(set) lazy var backgroundContext: NSManagedObjectContext = {
        return persistentContainer.newBackgroundContext()
    }()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "TickersDataModel")
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
}
