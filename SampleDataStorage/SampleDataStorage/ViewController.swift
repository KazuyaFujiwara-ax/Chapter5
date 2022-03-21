//
//  ViewController.swift
//  SampleDataStorage
//
//  Created by AXLT0220-AP on 2022/03/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        
        if let value = userDefaults.string(forKey: "text") {
            textField.text = value
        }
    }
    
    @IBAction func tapActionButton(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(textField.text, forKey: "text")
        userDefaults.synchronize()
    }
}

