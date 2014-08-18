//
//  ViewController.swift
//  tips
//
//  Created by Marc Greenberg on 8/16/14.
//  Copyright (c) 2014 Marc Greenberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var tipLabel : UILabel
    @IBOutlet var billField : UITextField
    @IBOutlet var totalLabel : UILabel
    @IBOutlet var tipControl : UISegmentedControl
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender : AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender : AnyObject) {
        view.endEditing(true)
    }
}

