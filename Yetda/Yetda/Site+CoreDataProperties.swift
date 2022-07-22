//
//  Site+CoreDataProperties.swift
//  Yetda
//
//  Created by Geunil Park on 2022/07/17.
//
//

import Foundation
import CoreData


extension Site {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Site> {
        return NSFetchRequest<Site>(entityName: "Site")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var location: String?
    @NSManaged public var present: NSSet?
    
    public var presentArray: [Present] {
        let set = present as? Set<Present> ?? []
        
        return set.sorted {
            $0.date! > $1.date!
        }
    }
}

// MARK: Generated accessors for present
extension Site {

    @objc(addPresentObject:)
    @NSManaged public func addToPresent(_ value: Present)

    @objc(removePresentObject:)
    @NSManaged public func removeFromPresent(_ value: Present)

    @objc(addPresent:)
    @NSManaged public func addToPresent(_ values: NSSet)

    @objc(removePresent:)
    @NSManaged public func removeFromPresent(_ values: NSSet)

}

extension Site : Identifiable {

}
