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
    @IBOutlet weak var plusLabel: UILabel!
    
    @IBOutlet weak var barSepLine: UIView!
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var tipPercents: UISegmentedControl!
    
    @IBOutlet weak var splitTwoLabel: UILabel!
    @IBOutlet weak var splitThreeLabel: UILabel!
    @IBOutlet weak var splitFourLabel: UILabel!
    @IBOutlet weak var splitTwoText: UILabel!
    @IBOutlet weak var splitThreeText: UILabel!
    @IBOutlet weak var splitFourText: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    var formatter = NSNumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.numberStyle = .CurrencyStyle
        
        billField.placeholder = formatter.stringFromNumber(0.00)
        let zeroVal = formatter.stringFromNumber(0.00)
        
        //self.title = "Tip Calculator"
        tipLabel.text = zeroVal
        totalLabel.text = zeroVal
        billField.becomeFirstResponder()
        
        self.tipPercents.alpha = 0
        self.tipLabel.alpha = 0
        self.totalLabel.alpha = 0
        self.barSepLine.alpha = 0
        self.tipText.alpha = 0
        self.totalText.alpha = 0
        self.plusLabel.alpha = 0
        self.splitTwoLabel.alpha = 0
        self.splitTwoText.alpha = 0
        self.splitThreeLabel.alpha = 0
        self.splitThreeText.alpha = 0
        self.splitFourLabel.alpha = 0
        self.splitFourText.alpha = 0
        
        
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
        
        let themeIndex = defaults.integerForKey("theme_index")
        
        let orange = UIColor(red: 255/255, green: 174/255, blue: 0/255, alpha: 1.0)
        let blue = UIColor(red: 0/255, green: 191/255, blue: 255/255, alpha: 1.0)
        
        if(themeIndex == 0)
        {
            barView.backgroundColor = orange
            tipPercents.backgroundColor = blue
            billField.backgroundColor = blue
        }
        else
        {
            barView.backgroundColor = blue
            tipPercents.backgroundColor = orange
            billField.backgroundColor = orange
        }
        
        let lastOpen = defaults.objectForKey("last_open")
        if lastOpen != nil {
            let current = NSDate.timeIntervalSinceReferenceDate()
            let change = current - (lastOpen as! Double!)
            if change < 60 * 10 {
                let billVal = defaults.objectForKey("bill_value")
                if billVal != nil {
                    if billVal as! Double! != 0 {
                        billField.text = String(billVal)
                    }
                }
            }
        }
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
            self.plusLabel.alpha = 1
            self.barSepLine.alpha = 1
            self.splitTwoLabel.alpha = 1
            self.splitTwoText.alpha = 1
            self.splitThreeLabel.alpha = 1
            self.splitThreeText.alpha = 1
            self.splitFourLabel.alpha = 1
            self.splitFourText.alpha = 1
        })
        
        UIView.animateWithDuration(0.5, animations: {
            var newCenter = self.billField.center
            newCenter.x = 230
            newCenter.y = 180
            self.billField.center = newCenter
            
            var newCenter1 = self.billAmtLabel.center
            newCenter1.x = 90
            newCenter1.y = 180
            self.billAmtLabel.center = newCenter1
            
        })
        
        formatter.numberStyle = .CurrencyStyle
        
        let tipPercentages = [0.18, 0.2, 0.25]
        let tipPer = tipPercentages[tipPercents.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPer
        let total = billAmount + tip
        let two = total / 2
        let three = total / 3
        let four = total / 4
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
        splitTwoText.text = formatter.stringFromNumber(two)
        splitThreeText.text = formatter.stringFromNumber(three)
        splitFourText.text = formatter.stringFromNumber(four)
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}
