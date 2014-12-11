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
    
    func plant (toPlant : CropType, isInsured : Bool) {
        self.crop = Crop(typeGiven: toPlant, insuredGiven: isInsured)
    }
    
    func harvest () -> Int {
        var money :Int
        let info = CropInfo.self
        
        
        money = CropInfo.soy.price.uninsured
        
        info.soy.price.uninsured
        
        return
    }
    
    
    
}
