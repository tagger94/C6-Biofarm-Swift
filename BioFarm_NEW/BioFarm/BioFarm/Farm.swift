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
    
    public init(){
        farmLand = ["F1": Land(size: 100), "F2": Land(size: 200), "F3": Land(size: 300), "F4": Land(size: 400)]
        cash = 1000000
    }
    
    private func totalProfit() -> Double{
        var sum : Double = 0
        var e = Event()
        
        var modifier: Double = e.doEvent()
        for (farm, land) in farmLand{
            sum += land.harvest()
        }
        
        
        var profit = Double (sum) * modifier
        return profit
    }
    
    func plantCrops(farm : String, cropToPlant : Crop) -> Double{
        return farmLand[farm]!.plant(cropToPlant)
        //plant crop animation
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
    
}