//
//  ViewController.swift
//  TipTop
//
//  Created by Jesse Battalino on 1/3/17.
//  Copyright © 2017 Jesse Battalino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    //let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Sets the title in the Navigation Bar
        self.title = "TipTop Calculator"
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(_ sender: Any) {
        /* debug: testing user input
        print("User edited bill")*/
        
        let tipPercentages = [0.15, 0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        if (billField.text != "" && billField.text != ".") {
            let billAmount = Double(billField.text!)!
            let tip = billAmount * tipPercentage
            let total = billAmount + tip
        
            tipLabel.text = "$\(tip)"
            totalLabel.text = "$\(total)"
        
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        } else {
            tipLabel.text = "$0.00"
            totalLabel.text = "$0.00"
        }
    }
    @IBAction func tipControlChanged(_ sender: Any) {
        onEditingChanged(true)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    //Optional additional view... Not supported at this time.
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destView : SettingsViewController = segue.destination as! SettingsViewController
    }*/
    
}
