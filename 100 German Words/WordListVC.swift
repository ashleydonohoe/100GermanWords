//
//  WordListVC.swift
//  100 German Words
//
//  Created by Ashley Donohoe on 9/26/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit

class WordListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let word1 = Word(germanWord: "das Haus", englishWord: "the house", germanExample: "Das Haus ist grün.", englishExample: "The house is green.", learned: false, starred: false)
    let word2 = Word(germanWord: "die Tür", englishWord: "the door", germanExample: "Die Tür ist zu.", englishExample: "The door is closed.", learned: false, starred: false)
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath) as! WordCell
        cell.germanTextLabel.text = "das Haus"
        cell.englishTextLabel.text = "the house"
        cell.starredIcon.setBackgroundImage(UIImage(named: "starNoFill"), for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }


}

