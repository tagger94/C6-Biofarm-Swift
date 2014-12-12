//
//  Land.swift
//  BioFarm
//
//  Created by Berns, Alex J on 12/11/14.
//
//

import Foundation

//enum LandType {
//    case Wet
//    case Dry
//}

class Land {
    private var crop : Crop?
    //    var type : LandType
    private let size : Int
    
    init(size : Int) {
        self.size = size
    }
    
    func plant (toPlant : Crop){
        crop = toPlant
    }
    
    func harvest () -> Int {
//        var money : Int
//        let info = CropInfo.self
        
        
        var money : Int = CropInfo.soy.money.profit.rawValue
        
        
        
        return 2
    }
    
    
    
}
