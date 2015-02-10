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
        return crop.getCost() * Double(self.size)
    }
    
    func harvest (modifier : Double) -> Double {
        var profit : Double = self.crop.getProfit() * Double(self.size)
        
        if(crop.isInsured()) {
            profit = profit * max(modifier,0.75)
        } else {
            profit = profit * modifier
        }
        
        crop = Crop() // Resets crop to blank
        return profit
    }
    
//    func getSize () -> Int {
//        return size
//    }
    
    func getSize() -> Double {
        return Double(size)
    }
    
    func getCrop() -> Crop {
        return crop
    }
    
    
}
