//
//  Present+CoreDataProperties.swift
//  Yetda
//
//  Created by Geunil Park on 2022/07/17.
//
//

import Foundation
import CoreData


extension Present {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Present> {
        return NSFetchRequest<Present>(entityName: "Present")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var whosFor: String?
    @NSManaged public var keyWord: String?
    @NSManaged public var content: String?
    @NSManaged public var location: String?
    @NSManaged public var date: Date?
    @NSManaged public var image1: Data?
    @NSManaged public var image2: Data?
    @NSManaged public var image3: Data?
    @NSManaged public var image4: Data?
    @NSManaged public var image5: Data?
    @NSManaged public var site: Site?

}

extension Present : Identifiable {

}
