//
//  SettingsViewController.swift
//  tip-calculator
//
//  Created by Varun on 12/24/18.
//  Copyright © 2018 Varun. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl2: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let t = defaults.double(forKey: "myDouble")
        print(t)
        if(t==0.1)
        {
            tipControl2.selectedSegmentIndex = 0
        }
        else if(t==0.2)
        {
            tipControl2.selectedSegmentIndex = 1
        }
        else if(t==0.3)
        {
            tipControl2.selectedSegmentIndex = 2
        }
        else
        {
            tipControl2.selectedSegmentIndex = 0
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func settingsChange(_ sender: Any)
    {
        //print("hello there")
        let tipPercents = [0.1,0.2,0.3]
        let tip = tipPercents[tipControl2.selectedSegmentIndex]
        //print(tip)
        let defaults = UserDefaults.standard
        defaults.set(tip, forKey: "myDouble")
        defaults.synchronize()

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
