//
//  ViewController.swift
//  Calculator
//
//  Created by Murari Varma on 12/11/17.
//  Copyright © 2017 murarivarma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let textCurrentlyInDisplay = display!.text!
        display!.text = textCurrentlyInDisplay + digit
    }
    
}

