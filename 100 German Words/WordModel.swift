//
//  WordModel.swift
//  100 German Words
//
//  Created by Gabriele on 9/26/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import Foundation

// This is just a test model for Words before Core Data is implemented

struct Word {
    let germanWord: String!
    let englishWord: String!
    let germanExample: String!
    let englishExample: String!
    var learned: Bool!
    var starred: Bool!
}
