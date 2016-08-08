//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://www.jessesquires.com/JSQCoreDataKit
//
//
//  GitHub
//  https://github.com/jessesquires/JSQCoreDataKit
//
//
//  License
//  Copyright © 2015 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

import Foundation
import CoreData
import JSQCoreDataKit

public class Person: NSManagedObject, CoreDataEntityProtocol {

    // MARK: CoreDataEntityProtocol

    public static let defaultSortDescriptors = [ NSSortDescriptor(key: "name", ascending: true) ]

    // MARK: Properties

    @NSManaged public var name: String
    @NSManaged public var birthDate: Date

    // MARK: Init

    internal init(context: NSManagedObjectContext,
                  entity: NSEntityDescription,
                  name: String,
                  birthDate: Date) {
        super.init(entity: entity, insertInto: context)
        self.name = name
        self.birthDate = birthDate
    }

    @objc
    internal override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
}
