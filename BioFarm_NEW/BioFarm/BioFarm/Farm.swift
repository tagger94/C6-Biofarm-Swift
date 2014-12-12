//
//  Farm.swift
//  BioFarm
//
//  Created by Berns, Alex J on 12/11/14.
//
//

import Foundation

class Farm {
    
    var farmLand: [String:Land]
    var cash
    
    init(){
        farmland = ["F1": var L1 = Land(), "F2": var L2 = Land(), "F3": var L3 = Land(), "F4": var L4 = Land()]
        cash = money()
    }
    
    private func totalProfit(){
        var sum
        var e = Event()
        var modifier: Double = e.doEvent
        for (farm, land) in farmLand{
            sum += land.harvest
        }
        var profit = sum * modifier
        return profit
    }
    
    func changeMoney(amount : Double){
        cash.addCash(amount)
    }
    
    func plantCrops(farm : String, cropType : Crop){
        l = farmland[farm]
        l.plant(cropType)
        //plants crop animation
    }
    
}