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

class Crop  {
    var type = CropType.Corn
    var insured : Bool
    
    
    init (typeGiven : CropType, insuredGiven : Bool) {
        type = typeGiven
        insured = insuredGiven
    }
    
    
    
}