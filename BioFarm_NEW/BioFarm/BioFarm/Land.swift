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

enum CropType {
    case Corn
    case Grass
    case Soy
    case Empty
}

class Land {
    private let size : Int
    private var type : CropType
    private var insured : Bool

    init(size : Int) {
        self.size = size
        type = CropType.Empty
        insured = false
    }
    
    init(size : Int, type : CropType, insur : Bool){
        self.size = size
        self.type = type
        insured = insur
    }
    
    //LAND FUNCTIONS
    
    func plant (toPlant : CropType) -> Double{
        type = toPlant
        return self.getCropCost() * Double(self.size)
    }
    
    func harvest (modifier : Double) -> Double {
        var profit : Double = self.getCropProfit() * Double(self.size)
        
        if(self.isInsured()) {
            profit = profit * max(modifier,0.75)
        } else {
            profit = profit * modifier
        }
        
        type = .Empty // Resets crop to blank
        return profit
    }
    
    func getLandSize() -> Double {
        return Double(size)
    }
    
    func copy() -> Land{
        let tempLand = Land(size: size,type: type,insur: insured)
        return tempLand
    }
    
    //CROP FUNCTIONS
    
    func getCrop() -> CropType {
        return self.type
    }
    
    func getCropCost() -> Double {
        switch type {
        case .Corn :
            if(insured) {
                return 800
            }
            else {
                return 600
            }
        case .Soy :
            if(insured){
                return 600
            }
            else {
                return 450
            }
        case .Grass : return 150
        case .Empty : return 7
        }
    }
    
    func getCropName() ->String {
        switch type {
        case .Corn: return "Corn"
        case .Soy: return "Soybean"
        case .Grass: return "Switchgrass"
        case .Empty: return "Empty"
        }
    }
    
    func getCropProfit() -> Double {
        switch type {
        case .Corn : return 900
        case .Soy : return 750
        case .Grass : return 300
        case .Empty : return 0
        }
    }
    
    func getCropSprite() -> String {
        switch type {
        case .Corn : return "R-corn.png"
        case .Soy : return "R-soybean.png"
        case .Grass : return "R-switchgrass.png"
        case .Empty : return ""
        }
    }
    
    func isInsured() -> Bool {
        return insured
    }
    
    func setCrop (newCrop : CropType) {
        type = newCrop
    }
    
    func setInsured (newInsured : Bool) {
        insured = newInsured
    }
    
}
