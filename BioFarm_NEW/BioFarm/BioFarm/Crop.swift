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

    struct corn {
        enum money : Int {
            case insured = 800
            case uninsured = 600
            case profit = 900
        }
        
        enum sprites : String {
            case sprite_1 = "corn"
        }
        
    }
    
    struct soy {
        enum money : Int {
            case insured = 600
            case uninsured = 450
            case profit = 750
        }
        
        enum sprites : String {
            case sprite_1 = "soybean"
        }
        
    }
    
    struct grass {
        enum money : Int {
            case uninsured = 150
            case profit = 300
        }
        
        enum sprites : String {
            case sprite_1 = "switchgrass"
        }
        
    }
    
    
    
    
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