//
//  Achievement+CoreDataProperties.swift
//  Tickers
//
//  Created by Rebeca Rodrigues on 19/07/23.
//
//

import Foundation
import CoreData


extension Achievement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Achievement> {
        return NSFetchRequest<Achievement>(entityName: "Achievement")
    }

    @NSManaged public var xpAtual: Float
    @NSManaged public var xpTotal: Float
    @NSManaged public var id: UUID?
    @NSManaged public var isCompleted: Bool

}

extension Achievement : Identifiable {

}
