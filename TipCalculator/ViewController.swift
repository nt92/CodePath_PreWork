//  TipCalculator
//
//  Created by Nikhil Thota on 12/14/15.
//  Copyright © 2015 Nikhil Thota. All rights reserved.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billAmtLabel: UILabel!
    @IBOutlet weak var totalText: UILabel!
    @IBOutlet weak var tipText: UILabel!
    
    @IBOutlet weak var barSepLine: UIView!
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var tipPercents: UISegmentedControl!
    
    @IBOutlet weak var billField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "Tip Calculator"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField.becomeFirstResponder()
        
        self.tipPercents.alpha = 0
        self.tipLabel.alpha = 0
        self.totalLabel.alpha = 0
        self.barSepLine.alpha = 0
        self.tipText.alpha = 0
        self.totalText.alpha = 0
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(0.2, forKey: "tip")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let percentValue = defaults.integerForKey("tip_val")
        tipPercents.selectedSegmentIndex = percentValue
        super.viewWillAppear(animated)
        //print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        //print("view did disappear")
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        UIView.animateWithDuration(0.4, animations: {
            self.tipPercents.alpha = 1
            self.billField.alpha = 1
            self.tipLabel.alpha = 1
            self.totalLabel.alpha = 1
            self.billAmtLabel.alpha = 1
            self.barView.alpha = 1
            self.tipText.alpha = 1
            self.totalText.alpha = 1
        })
        
        UIView.animateWithDuration(0.5, animations: {
            var newCenter = self.billField.center
            newCenter.x = 183
            newCenter.y = 80
            self.billField.center = newCenter
            
        })
        
        let tipPercentages = [0.18, 0.2, 0.25]
        var tipPer = tipPercentages[tipPercents.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPer
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}
