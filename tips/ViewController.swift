//
//  ViewController.swift
//  tips
//
//  Created by Aditya Balwani on 1/28/16.
//  Copyright © 2016 Aditya Balwani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TipLabel: UILabel!
    
    @IBOutlet weak var BillField: UITextField!
    
    @IBOutlet weak var TotalLabel: UILabel!
    
    @IBOutlet weak var TipControlRadio: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TipLabel.text = "$0.00"
        TotalLabel.text = "$0.00"
        

        let defaultTip = defaults.integerForKey("defaultTip")
        
        TipControlRadio.selectedSegmentIndex = defaultTip
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onEditChanged(sender: AnyObject) {
        updateValues()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateValues() {
        let tipPercentages = [0.18, 0.2, 0.22]
        //        print(tipPercentages[0])
        //        print(TipPercentRadio)
        
        let tipPercentage = tipPercentages[TipControlRadio.selectedSegmentIndex]
        
        let billAmount = NSString(string: BillField.text!).doubleValue
        
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        TipLabel.text = String(format: "$%.2f", tip)
        TotalLabel.text = String(format: "$%.2f", total)

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        let defaultTip = defaults.integerForKey("defaultTip")
        
        TipControlRadio.selectedSegmentIndex = defaultTip
        updateValues()
    }


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

