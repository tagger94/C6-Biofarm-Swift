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
    var crop : Crop?
    //    var type : LandType
    var size : Int
    
    init(size : Int) {
        self.size = size
    }
    
    func plant (toPlant : CropType, isInsured : Bool) {
        self.crop = Crop(typeGiven: toPlant, insuredGiven: isInsured)
    }
    
    
    
}
