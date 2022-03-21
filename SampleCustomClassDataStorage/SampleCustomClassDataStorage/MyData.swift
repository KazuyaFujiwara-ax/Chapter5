//
//  MyData.swift
//  SampleCustomClassDataStorage
//
//  Created by AXLT0220-AP on 2022/03/20.
//

import Foundation

class MyData: NSObject, NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true
    }
    
    var valueString: String?
    
    override init() {
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(valueString, forKey: "valueString")
    }
    
    required init?(coder aDecoder: NSCoder) {
        valueString = aDecoder.decodeObject(forKey: "valueString") as? String
    }
}
