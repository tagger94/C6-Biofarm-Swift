//
//  Farm.swift
//  BioFarm
//
//  Created by Berns, Alex J on 12/11/14.
//
//

import Foundation

public class Farm {
    
    var farmLand : [String:Land]
    var cash: Double
    
    init(){
        farmLand = ["F1": Land(size: 175), "F2": Land(size: 250), "F3": Land(size: 180), "F4": Land(size: 150), "F5": Land(size: 60), "F6": Land(size: 60), "F7":Land(size: 65), "F8":Land(size: 60)]
        cash = 1000000
    }
    
    func harvestAll(modifier : Double) -> Double{
        var sum : Double = 0

        for (farm, land) in farmLand{
            sum += land.harvest(modifier)
        }
        
        
        //var profit = Double (sum) * modifier
        return sum
    }
    
    func plantCrops(farm : String, cropToPlant : Crop) -> Double{
        return farmLand[farm]!.plant(cropToPlant)
        //plant crop animation
    }
    
    func getCrops(farmName : String) -> Crop {
        return farmLand[farmName]!.getCrop()
    }
    
    func addMoney(amount : Double){
        cash = cash + amount
    }
    
    func subMoney(amount : Double){
        cash = cash - amount
    }
    
    func getCash() -> Double{
        return cash
    }
    
    func getLandSize(farmName : String) -> Double {
        return farmLand[farmName]!.getSize()
    }
    
}