//
//  ViewController.swift
//  tip-calculator
//
//  Created by Varun on 12/6/18.
//  Copyright © 2018 Varun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billValue: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        let t = defaults.double(forKey: "myDouble")
        print(t)
        if(t==0.1)
        {
            tipControl.selectedSegmentIndex = 0
        }
        else if(t==0.2)
        {
            tipControl.selectedSegmentIndex = 1
        }
        else if(t==0.3)
        {
            tipControl.selectedSegmentIndex = 2
        }
        else
        {
            tipControl.selectedSegmentIndex = 0
        }
        commmonTask()
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //print("view did disappear")
    }
    
    @IBAction func calculateTip(_ sender: Any) {

        commmonTask()
    }
    
    func commmonTask(){
        let tipPercents = [0.1,0.2,0.3]
        let bill = Double(billValue.text!) ?? 0
        let tip = bill * tipPercents[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

