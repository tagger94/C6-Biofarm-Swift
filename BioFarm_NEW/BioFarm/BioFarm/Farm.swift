//
//  Farm.swift
//  BioFarm
//
//  Created by Berns, Alex J on 12/11/14.
//
//

import Foundation

public class Farm {
    
    let farmLand : [Int:Land]
    var cash: Double
    
    init(){
        farmLand = [1: Land(size: 175), 2: Land(size: 250), 3: Land(size: 180), 4: Land(size: 150), 5: Land(size: 60), 6: Land(size: 60), 7:Land(size: 65), 8:Land(size: 60)]
        cash = 1000000
    }
    
    init(f : [Int:Land], c : Double){
        farmLand = f
        cash = c
    }
    
    func harvestAll(modifier : Double) -> Double{
        var sum : Double = 0

        for (farm, land) in farmLand{
            sum += land.harvest(modifier)
        }
        
        //var profit = Double (sum) * modifier
        return sum
    }
    
    //Money Methods $$
    func addMoney(amount : Double){
        cash = cash + amount
    }
    
    func subMoney(amount : Double){
        cash = cash - amount
    }
    
    func getCash() -> Double{
        return cash
    }
    
    func copy() -> Farm{
        var temp_farm : Farm
        var temp_fland : [Int:Land] = [1: Land(size: 175), 2: Land(size: 250), 3: Land(size: 180), 4: Land(size: 150), 5: Land(size: 60), 6: Land(size: 60), 7:Land(size: 65), 8:Land(size: 60)]
        var i : Int = 1
        
        for(farm, land) in farmLand{
            let tempLand = land.copy()
            temp_fland[i] = tempLand
            i++
        }
        
        temp_farm = Farm(f: temp_fland, c: cash)
        return temp_farm
    }
    
}