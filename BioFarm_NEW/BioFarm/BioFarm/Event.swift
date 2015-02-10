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
    
    var rand: Int = 0
    
    
    func doEvent() -> Double {
        rand = Int(arc4random_uniform(1000)) + 1
        println(rand)
        if(rand <= 600) {
            return 1.0
        }
        if(rand <= 760) {
            return 0.6
        }
        if(rand <= 868) {
            return 0.7
        }
        if(rand <= 884) {
            return 0.0
        }
        if(rand <= 896) {
            return 0.6
        }
        if(rand <= 944) {
            return 0.5
        }
        if(rand <= 952) {
            return 0.6
        }
        if(rand <= 960) {
            return 0.6
        }
        if(rand <= 972) {
            return 0.7
        }
        if(rand <= 975) {
            return 0.7
        }
        if(rand <= 980) {
            return 0.8
        }
        if(rand <= 985) {
            return 0.9
        }
        if(rand <= 990) {
            return 0.4
        }
        if(rand <= 995) {
            return 0.0
        }
        if(rand <= 1000) {
            return 0.0
        }
        //Default
        return 1.2
    }
}