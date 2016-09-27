//
//  WordListVC.swift
//  100 German Words
//
//  Created by Ashley Donohoe on 9/26/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit

class WordListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var words = [
    WordM(germanWord: "das Haus", englishWord: "the house", germanExample: "Das Haus ist grün.", englishExample: "The house is green.", learned: false, starred: true),
        WordM(germanWord: "die Tür", englishWord: "the door", germanExample: "Die Tür ist zu.", englishExample: "The door is closed.", learned: true, starred: false)
        ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath) as! WordCell
        cell.configureCell(word: words[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        DispatchQueue.main.async(execute: {
           self.performSegue(withIdentifier: "ShowWordDetail", sender: self.words[indexPath.row])
        })
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowWordDetail" {
            if let controller = segue.destination as? ShowWordDetail {
                controller.word = sender as! WordM?
            }
        }
    }

}

