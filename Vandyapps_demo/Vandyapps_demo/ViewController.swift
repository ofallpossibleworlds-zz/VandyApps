//
//  ViewController.swift
//  Vandyapps_demo
//
//  Created by Robby on 9/19/17.
//  Copyright © 2017 Marshall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var partyField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        tipPercentLabel.text = String(Int(tipSlider.value)) + "%"
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        if let text = amountField.text {
            NSLog(text)
        }
    }
}

