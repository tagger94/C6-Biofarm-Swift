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
    var mod = (eventModifier: 0.0, eventText: " ")
    
    //Returns the Modifer of the Event that has been chosen
    func getModifier() ->(eventModifier: Double, eventText: String){
        return (mod.eventModifier, mod.eventText)
    }
    
    //Randomly Chooses an Event
    func doEvent() -> (eventModifier: Double, eventText: String) {
        rand = Int(arc4random_uniform(1000)) + 1
        if(rand <= 600) {
            mod.eventModifier = 1.0
            mod.eventText = "You had a good year!"
        }
        else if(rand <= 760) {
            mod.eventModifier = 0.6
            mod.eventText = "There was a drought this year -40% yeild."
        }
        else if(rand <= 868) {
            mod.eventModifier = 0.7
            mod.eventText = "There was a lot of excess moisture this year. -30% yeild."
        }
        else if(rand <= 884) {
            mod.eventModifier = 0.0
            mod.eventText = "There was a flood this year -100% yeild."
        }
        else if(rand <= 896) {
            mod.eventModifier = 0.6
            mod.eventText = "There was a late frost this year -40% yeild."
        }
        else if(rand <= 944) {
            mod.eventModifier = 0.5
            mod.eventText = "There was hail damage to your crops. -50% yeild."
        }
        else if(rand <= 952) {
            mod.eventModifier = 0.6
            mod.eventText = "There was instect and pest damage to your fields. -40% yeild."
        }
        else if(rand <= 960) {
            mod.eventModifier = 0.6
            mod.eventText = "There was a plant disease outbreak this year. -40% yeild."
        }
        else if(rand <= 972) {
            mod.eventModifier = 0.7
            mod.eventText = "There was wind damage to your crops. -30% yeild."
        }
        else if(rand <= 975) {
            mod.eventModifier = 0.7
            mod.eventText = "There was a damage to your fields from a tornado. -30% yeild."
        }
        else if(rand <= 980) {
            mod.eventModifier = 0.8
            mod.eventText = "Someone tore through your fields Dukes of Hazard style. -20% yeild."
        }
        else if(rand <= 985) {
            mod.eventModifier = 0.9
            mod.eventText = "Aliens left crop circles in your fields. -10% yeild."
        }
        else if(rand <= 990) {
            mod.eventModifier = 0.4
            mod.eventText = "There was a freak snowstorm this year. -40% yeild."
        }
        else if(rand <= 995) {
            mod.eventModifier = 0.0
            mod.eventText = "Lightning started a fire in your fields. -100% yeild."
        }
        else if(rand <= 1000) {
            mod.eventModifier = 0.0
            mod.eventText = "Your combine lit on fire. -100% yeild."
        }
        //Default
        return (mod.eventModifier,mod.eventText)
    }
}