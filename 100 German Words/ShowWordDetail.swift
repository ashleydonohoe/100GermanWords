//
//  ShowWordDetail.swift
//  100 German Words
//
//  Created by Gabriele on 9/26/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit

class ShowWordDetail: UIViewController {
    
    @IBOutlet weak var starredIcon: UIButton!
    @IBOutlet weak var learnedStatus: UIButton!
    @IBOutlet weak var englishSentence: UILabel!
    @IBOutlet weak var germanSentence: UILabel!
    @IBOutlet weak var englishWord: UILabel!
    @IBOutlet weak var germanWord: UILabel!
    
    var word: Word!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWordDetails()
    }


    @IBAction func goBack(_ sender: AnyObject) {
       dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateStarredStatus(_ sender: AnyObject) {
        let currentWord: Word = word!
        let currentStatus = word.starred
        currentWord.starred = !currentStatus
        if currentWord.starred == true {
            starredIcon.setBackgroundImage(UIImage(named: "starfilled"), for: .normal)
        } else {
            starredIcon.setBackgroundImage(UIImage(named: "starnofill"), for: .normal)
        }
        
        ad.saveContext()
        
    }
    
    @IBAction func markLearnedStatus(_ sender: UIButton) {
        
        let currentWord: Word = word!
        let currentStatus = word.learned
        print("Current status: \(currentStatus)")
        currentWord.learned = !currentStatus
        if currentWord.learned == true {
            learnedStatus.setTitle("Mark As Unlearned", for: .normal)
        } else {
            learnedStatus.setTitle("Mark As Learned", for: .normal)
        }
        
        print("Changed Status: \(currentWord.learned)")
        ad.saveContext()
        
    }
    
    func loadWordDetails() {
        if word != nil {
            germanWord.text = word.germanWord
            englishWord.text = word.englishWord
            germanSentence.text = word.germanExample
            englishSentence.text = word.englishExample
            
            if word.learned == true {
                learnedStatus.setTitle("Mark As Unlearned", for: .normal)
            } else {
                learnedStatus.setTitle("Mark As Learned", for: .normal)
            }
            
            if word.starred == true {
                starredIcon.setBackgroundImage(UIImage(named: "starfilled"), for: .normal)
            } else {
                starredIcon.setBackgroundImage(UIImage(named: "starnofill"), for: .normal)
            }
        }
    }
}
