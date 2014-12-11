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
}

struct CropInfo {
//    struct Corn {
//        struct price {
//            var insured = 800
//            var uninsured = 600
//        }
//        
//        var profit : Int = 900
//        
//        let sprite = "soybean"
//    }
    
    struct soy {
       
        
        let profit = 750
        
        let sprite = "soybean"
        
        enum price : Int {
            case insured = 600
            case uninsured = 450
        }
    }
    
//    let corn : Corn
    let Soy : soy
    
    
}

class Crop  {
    private var type = CropType.Corn
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
    
    func isInsured() -> Bool {
        return insured
    }
    
    
    
}