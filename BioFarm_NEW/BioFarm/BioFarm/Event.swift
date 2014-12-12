//
//  Event.swift
//  BioFarm
//
//  Created by Voigt, Camden J on 12/11/14.
//
//chooses random event and does animation

import Foundation

//add annimations

class Event{
    
    var rand: Int
    
    init(){
        rand = Int(arc4random_uniform(1000)) + 1
    }
    
    func doEvent() -> Double{
        switch(rand){
        case 600:
            return 1
        case 760:
            return 0.6
        case 868:
            return 0.7
        case 884:
            return 0
        case 896:
            return 0.6
        case 944:
            return 0.5
        case 952:
            return 0.6
        case 960:
            return 960
        case 972:
            return 0.7
        case 975:
            return 0.7
        case 980:
            return 0.8
        case 985:
            return 0.9
        case 990:
            return 0.4
        case 995:
            return 0.0
        case 1000:
            return 0
        default:
            return 10.0
            
        }
    }
    
}