//
//  ShowWordDetail.swift
//  100 German Words
//
//  Created by Gabriele on 9/26/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit

class ShowWordDetail: UIViewController {
    
    var word: Word?

    override func viewDidLoad() {
        super.viewDidLoad()

        if word != nil {
            print(word)
        }
        // Do any additional setup after loading the view.
    }

}
