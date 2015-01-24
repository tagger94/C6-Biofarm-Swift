//
//  Crop.swift
//  BioFarm
//
//  Created by Berns, Alex J on 12/11/14.
//
//

import Foundation

enum CropType {
    case Corn
    case Grass
    case Soy
    case Empty
}

class Crop  {
    private var type : CropType
    private var insured : Bool
    
    
    init (typeGiven : CropType, insuredGiven : Bool) {
        type = typeGiven
        insured = insuredGiven
    }
    
    /*
    * Getters and Setters
    */
    func getCrop() -> CropType {
        return self.type
    }
    
    func getCost() -> Double {
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
        case .Empty : return 0
        }
        
    }
    
    func getProfit() -> Double {
        switch type {
        case .Corn : return 900
        case .Soy : return 750
        case .Grass : return 300
        case .Empty : return 0
        }
    }
    
    func getSprite() -> String {
        switch type {
        case .Corn : return "corn"
        case .Soy : return "soy"
        case .Grass : return "switchgrass"
        case .Empty : return ""
        }
    }
    
    func isInsured() -> Bool {
        return insured
    }
    
    
    
}