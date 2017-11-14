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
    
    var userIsTyping = false
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsTyping = true
    }
    
    
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            
            switch mathematicalSymbol {
            case "π":
                display.text = String(Double.pi)
            case "√":
                let operand = Double(display.text!)!
                display.text = String(sqrt(operand))
            default:
                break
            }
        }
    }
    
}

