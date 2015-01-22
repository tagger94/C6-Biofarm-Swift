//
//  Money.swift
//  BioFarm
//
//  Created by Voigt, Camden J on 12/11/14.
//
//

import Foundation

//add animations

class Money{
    
    var cash: Double
    
    init(){
        cash = 1000000
    }
    
    func add(amount : Double){
        cash = cash + amount
    }
    
    func sub(amount : Double){
        cash = cash - amount
    }
    
    func getCash() -> Double{
        return cash
    }
    
}