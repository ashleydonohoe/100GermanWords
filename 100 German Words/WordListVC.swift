//
//  WordListVC.swift
//  100 German Words
//
//  Created by Ashley Donohoe on 9/26/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit
import CoreData

class WordListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    //TODO: Make CSV file of words and convert them to CD objects
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var controller: NSFetchedResultsController<Word>!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        // Generate testData
//        generateTestData()
//        
        // Get the wordslist; will be updated later for AppDelegate to load SQlite DB on first run
        getWordList()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getWordList()
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath) as! WordCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func configureCell(cell: WordCell, indexPath: NSIndexPath) {
        let word = controller.object(at: indexPath as IndexPath)
        cell.configureCell(word: word)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let objs = controller.fetchedObjects, objs.count > 0 {
            let word = objs[indexPath.row]
            DispatchQueue.main.async(execute: {
                self.performSegue(withIdentifier: "ShowWordDetail", sender: word)
            })
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowWordDetail" {
            if let controller = segue.destination as? ShowWordDetail {
                if let word = sender as? Word {
                    controller.word = word
                }
            }
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    @IBAction func segmentChanged(_ sender: AnyObject) {
        getWordList()
        tableView.reloadData()
    }
    
    // Fetches word list from core data
    func getWordList() {
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        let showAll = NSSortDescriptor(key: "germanWord", ascending: true)
        fetchRequest.sortDescriptors = [showAll]
        
        
        if segmentedControl.selectedSegmentIndex == 1 {
            //TODO: Figure out how to filter based on the starred/learned values
            fetchRequest.sortDescriptors = [showAll]
            fetchRequest.predicate = NSPredicate(format: "learned == %@", true as CVarArg)
        } else if segmentedControl.selectedSegmentIndex == 2 {
            fetchRequest.predicate = NSPredicate(format: "learned == %@", false as CVarArg)
        } else if segmentedControl.selectedSegmentIndex == 3 {
              fetchRequest.predicate = NSPredicate(format: "starred == %@", true as CVarArg)
        }
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print(error.localizedDescription)
        }
    }
    
    func generateTestData() {
        let word1 = Word(context: context)
        word1.germanWord = "das Haus"
        word1.englishWord = "the house"
        word1.germanExample = "Das Haus ist grün."
        word1.englishExample = "The house is green."
        word1.learned = false
        word1.starred = true
        
        let word2 = Word(context: context)
        word2.germanWord = "die Tür"
        word2.englishWord = "the door"
        word2.germanExample = "Die Tür ist zu."
        word2.englishExample = "The door is closed."
        word2.learned = true
        word2.starred = false
        
        let word3 = Word(context: context)
        word3.germanWord = "die Liebe"
        word3.englishWord = "the love"
        word3.germanExample = "Die Liebe ist überall."
        word3.englishExample = "Love is everywhere."
        word3.learned = false
        word3.starred = false
        
        ad.saveContext()
        
    }

}

