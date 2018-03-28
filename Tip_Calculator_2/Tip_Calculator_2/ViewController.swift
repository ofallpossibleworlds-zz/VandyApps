//
//  ViewController.swift
//  Tip_Calculator_2
//
//  Created by Robby on 10/31/17.
//  Copyright © 2017 Marshall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billText: UITextField!
    
    @IBAction func calculate(_ sender: UIButton) {
        NSLog("Our bill is \(billText.text)")
    }

}

