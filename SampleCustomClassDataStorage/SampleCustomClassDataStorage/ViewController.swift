//
//  ViewController.swift
//  SampleCustomClassDataStorage
//
//  Created by AXLT0220-AP on 2022/03/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        let data = MyData()
        
        data.valueString = "test"
        
        do {
            let archiveData = try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: true)
            userDefaults.set(archiveData, forKey: "data")
            userDefaults.synchronize()
            
            if let storedData = userDefaults.object(forKey: "data") as? Data {
                if let unarchivedData = try NSKeyedUnarchiver.unarchivedObject(ofClass: MyData.self, from: storedData) {
                    if let valueString = unarchivedData.valueString {
                        print("デシリアライズデータ:" + valueString)
                    }
                }
            }
        } catch {
            print("エラー \(error)")
        }
    }
}

