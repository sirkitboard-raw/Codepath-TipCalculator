//
//  SettingsViewController.swift
//  tips
//
//  Created by Aditya Balwani on 1/28/16.
//  Copyright © 2016 Aditya Balwani. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var TipDefaultRadio: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("defaultTip")
        
        TipDefaultRadio.selectedSegmentIndex = defaultTip
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onValueChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(TipDefaultRadio.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
