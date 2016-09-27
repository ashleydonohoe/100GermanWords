//
//  Word+CoreDataProperties.swift
//  100 German Words
//
//  Created by Gabriele on 9/27/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import Foundation
import CoreData


extension Word {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Word> {
        return NSFetchRequest<Word>(entityName: "Word");
    }

    @NSManaged public var germanWord: String?
    @NSManaged public var englishWord: String?
    @NSManaged public var germanExample: String?
    @NSManaged public var englishExample: String?
    @NSManaged public var learned: Bool
    @NSManaged public var starred: Bool

}
