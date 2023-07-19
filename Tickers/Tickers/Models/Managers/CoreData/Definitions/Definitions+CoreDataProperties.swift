//
//  Definitions+CoreDataProperties.swift
//  Tickers
//
//  Created by Alley Pereira on 17/07/23.
//
//

import Foundation
import CoreData

extension Definitions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Definitions> {
        return NSFetchRequest<Definitions>(entityName: "Definitions")
    }

    @NSManaged public var focusTime: Float
    @NSManaged public var shortRest: Float

}

extension Definitions : Identifiable {

}
