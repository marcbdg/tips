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
    @IBOutlet var resultsPane : UIView
    @IBOutlet var thanksMan : UIImageView
    @IBOutlet var thanksLabel : UILabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        // Hide the results fields (doing this here so I can still see them in the IB)
        resultsPane.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender : AnyObject) {
        
        // Dismiss the keyboard if the SegmentedControl was tapped
        if sender is UISegmentedControl {
            hideKeyboard()
        }
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        // Calculate and show the results field if the amount is >0
        if billAmount == nil || billAmount == 0 {
            UIView.animateWithDuration(0.4, animations: {
                self.resultsPane.alpha = 0
            })
            thanksMan.alpha = 0;
        } else {
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
            UIView.animateWithDuration(0.4, animations: {
                self.resultsPane.alpha = 1
            })
            thanksMan.alpha = 1;
        }
    }

    @IBAction func onTap(sender : AnyObject) {
        hideKeyboard()
    }
    
    func hideKeyboard() {
        view.endEditing(true)
        
        var billAmount = NSString(string: billField.text).doubleValue
        if billAmount == nil || billAmount == 0 {
            self.thanksLabel.alpha = 0
        } else {
            UIView.animateWithDuration(1, animations: {
                self.thanksLabel.alpha = 1
            })
        }
    }
}

