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
    private var crop : Crop
    private let size : Int

    
    init(size : Int) {
        self.size = size
        crop = Crop(typeGiven: CropType.Empty, insuredGiven: false)
    }
    
    func plant (toPlant : Crop) -> Double{
        crop = toPlant
        return crop.getCost()
    }
    
    func harvest () -> Double{
        return self.crop.getProfit() * Double(self.size)
    }
    
    func getSize () -> Int {
        return size
    }
}
