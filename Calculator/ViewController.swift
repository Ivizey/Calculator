//
//  ViewController.swift
//  Calculator
//
//  Created by mac on 21.10.19.
//  Copyright © 2019 ivizey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var numberOnScreeen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true {
            label.text = String(sender.tag - 1)
            numberOnScreeen = Double(label.text!)!
            performingMath = false
        } else {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreeen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            previousNumber = Double(label.text!)!
            
            switch sender.tag {
            case 12: //Devide
                label.text = "/"
                break
            case 13: //Multiply
                label.text = "x"
                break
            case 14: //Minus
                label.text = "-"
                break
            case 15: //Plus
                label.text = "+"
                break
            default:
                print("Error")
                operation = sender.tag
                performingMath = true
            }
        }
        else if sender.tag == 16 {
            switch operation {
            case 12:
                label.text = String(previousNumber / numberOnScreeen)
            case 13:
                label.text = String(previousNumber * numberOnScreeen)
            case 14:
                label.text = String(previousNumber - numberOnScreeen)
            case 15:
                label.text = String(previousNumber + numberOnScreeen)
            default:
                print("Error!")
            }
        } else if sender.tag == 11 {
            label.text = ""
            previousNumber = 0
            numberOnScreeen = 0
            operation = 0
        }
    }
    
}

