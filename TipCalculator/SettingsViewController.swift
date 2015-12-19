//  TipCalculator
//
//  Created by Nikhil Thota on 12/18/15.
//  Copyright © 2015 Nikhil Thota. All rights reserved.

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var DefaultPercentSelect: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let percentIndex = defaults.integerForKey("tip_val")
        DefaultPercentSelect.selectedSegmentIndex = percentIndex
    }
    
    @IBAction func onTapSettings(sender: AnyObject) {
        view.endEditing(true)
        
    }
    @IBAction func onChangeDefaultPercent(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(DefaultPercentSelect.selectedSegmentIndex, forKey: "tip_val")
        defaults.synchronize()
    }

}
