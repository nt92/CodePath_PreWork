//  TipCalculator
//
//  Created by Nikhil Thota on 12/18/15.
//  Copyright © 2015 Nikhil Thota. All rights reserved.

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var DefaultPercentSelect: UISegmentedControl!
    @IBOutlet weak var themeSelect: UISegmentedControl!
    
    @IBOutlet weak var defaultLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    
    @IBOutlet var uiView: UIView!
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
        
        let themeIndex = defaults.integerForKey("theme_index")
        themeSelect.selectedSegmentIndex = themeIndex
        
        let orange = UIColor(red: 255/255, green: 174/255, blue: 0/255, alpha: 1.0)
        let blue = UIColor(red: 0/255, green: 191/255, blue: 255/255, alpha: 1.0)
        
        if(themeIndex == 0)
        {
            uiView.backgroundColor = orange
            DefaultPercentSelect.backgroundColor = blue
            themeSelect.backgroundColor = blue
        }
        else
        {
            uiView.backgroundColor = blue
            DefaultPercentSelect.backgroundColor = orange
            themeSelect.backgroundColor = orange
        }
    }
    
    @IBAction func onTapSettings(sender: AnyObject) {
        view.endEditing(true)
        
    }
    @IBAction func onChangeDefaultPercent(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(DefaultPercentSelect.selectedSegmentIndex, forKey: "tip_val")
        defaults.setInteger(themeSelect.selectedSegmentIndex, forKey: "theme_index")
        defaults.synchronize()
        
        let themeIndex = defaults.integerForKey("theme_index")
        themeSelect.selectedSegmentIndex = themeIndex
        
        let orange = UIColor(red: 255/255, green: 174/255, blue: 0/255, alpha: 1.0)
        let blue = UIColor(red: 0/255, green: 191/255, blue: 255/255, alpha: 1.0)
        
        if(themeIndex == 0)
        {
            uiView.backgroundColor = orange
            DefaultPercentSelect.backgroundColor = blue
            themeSelect.backgroundColor = blue
        }
        else
        {
            uiView.backgroundColor = blue
            DefaultPercentSelect.backgroundColor = orange
            themeSelect.backgroundColor = orange
        }
    }

}
