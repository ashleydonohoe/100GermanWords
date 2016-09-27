//
//  WordCell.swift
//  100 German Words
//
//  Created by Ashley Donohoe on 9/26/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit

class WordCell: UITableViewCell {
    @IBOutlet weak var starredIcon: UIButton!
    @IBOutlet weak var englishTextLabel: UILabel!
    @IBOutlet weak var germanTextLabel: UILabel!
    
    func configureCell(word: Word) {
        englishTextLabel.text = word.englishWord
        germanTextLabel.text = word.germanWord
        if word.starred == true {
            starredIcon.setBackgroundImage(UIImage(named: "starfilled"), for: .normal)
        } else {
            starredIcon.setBackgroundImage(UIImage(named: "starnofill"), for: .normal)
        }
    }

}
