//
//  CoreDataViewModel.swift
//  Tickers
//
//  Created by Alley Pereira on 05/07/23.
//

import Foundation
import CoreData

final class CoreDataViewModel<T: NSManagedObject> {
    
    private let viewContext: NSManagedObjectContext
    
    init(viewContext: NSManagedObjectContext = CoreDataManager.shared.persistentContainer.viewContext) {
        self.viewContext = viewContext
    }
    
    func fetchObjects() -> [T] {
        let fetchRequest: NSFetchRequest<T> = T.fetchRequest() as! NSFetchRequest<T>
        do {
            let objects = try viewContext.fetch(fetchRequest)
            return objects
        } catch {
            print("Failed to fetch objects: \(error)")
            return []
        }
        
    }
    
    func saveChanges() {
        do {
            try viewContext.save()
        } catch {
            print("Failed to save changes: \(error)")
        }
    }
    
    func addObject() -> T {
        let object = T(context: viewContext)
        return object
    }

    func deleteObject(_ object: T) {
        viewContext.delete(object)
        saveChanges()
    }
    
}
