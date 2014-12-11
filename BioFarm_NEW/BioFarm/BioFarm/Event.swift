//
//  Event.swift
//  BioFarm
//
//  Created by Voigt, Camden J on 12/11/14.
//
//chooses random event and does animation

import Foundation

//add annimations

class event{
    
    var rand: Int
    
    init(){
        rand = Int(arc4random_uniform(1000)) + 1
    }
    
    func doEvent() -> Double{
        switch(rand){
        case 600:
            return 1
            break
        case 760:
            return .6
            break
        case 868:
            return .7
            break
        case 884:
            return 0
            break
        case 896:
            return 0.6
            break
        case 944:
            return 0.5
            break
        case 952:
            return 0.6
            break
        case 960:
            return 960
            break
        case 972:
            return 0.7
            break
        case 975:
            return 0.7
            break
        case 980:
            return 0.8
            break
        case 985:
            return 0.9
            break
        case 990:
            return 0.4
            break
        case 995:
            return 0.0
            break
        case 1000:
            return 0
            break
        default:
            break
            
        }
    }
    
}