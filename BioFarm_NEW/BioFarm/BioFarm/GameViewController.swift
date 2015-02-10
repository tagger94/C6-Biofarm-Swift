//
//  GameViewController.swift
//  BioFarm
//
//  Created by Jay Staker on 1/23/15.
//
//

import Foundation
import UIKit

class GameViewController : UIViewController{
    
    //Labels
    @IBOutlet var lbl_Money : UILabel!
    
    @IBOutlet var lbl_Farm1: UILabel!
    @IBOutlet var lbl_Farm2: UILabel!
    @IBOutlet var lbl_Farm3: UILabel!
    @IBOutlet var lbl_Farm4: UILabel!
    @IBOutlet var lbl_Farm5: UILabel!
    @IBOutlet var lbl_Farm6: UILabel!
    @IBOutlet var lbl_Farm7: UILabel!
    @IBOutlet var lbl_Farm8: UILabel!
    
    //Buttons
    @IBOutlet var btn_Farm1 : UIButton!
    @IBOutlet var btn_Farm2: UIButton!
    @IBOutlet var btn_Farm3: UIButton!
    @IBOutlet var btn_Farm4: UIButton!
    @IBOutlet var btn_Farm5: UIButton!
    @IBOutlet var btn_Farm6: UIButton!
    @IBOutlet var btn_Farm7: UIButton!
    @IBOutlet var btn_Farm8: UIButton!
    @IBOutlet var harvestButton: UIButton!
    
    @IBOutlet var lbl_harvestMod: UILabel!
    
    @IBOutlet var labelFarm1Price: UILabel!
    
    
    var selectFarm : String = "F1"
    
    var megaFarm : Farm = Farm()
    var e : Event = Event()
    var modifier = 0.0
    
    var yearsPassed : Int = 0
    
    func refreshPlay(){
        println(megaFarm.getCash())
        lbl_Money.text = String(format: "$%.2f", megaFarm.getCash())
        
        //Update labels for each farm
        lbl_Farm1.text = String(format: "%.0f acres of %@", megaFarm.getLandSize("F1"), megaFarm.getCrops("F1").getCropName())
        lbl_Farm2.text = String(format: "%.0f acres of %@", megaFarm.getLandSize("F2"), megaFarm.getCrops("F2").getCropName())
        lbl_Farm3.text = String(format: "%.0f acres of %@", megaFarm.getLandSize("F3"), megaFarm.getCrops("F3").getCropName())
        lbl_Farm4.text = String(format: "%.0f acres of %@", megaFarm.getLandSize("F4"), megaFarm.getCrops("F4").getCropName())
        lbl_Farm5.text = String(format: "%.0f acres of %@", megaFarm.getLandSize("F5"), megaFarm.getCrops("F5").getCropName())
        lbl_Farm6.text = String(format: "%.0f acres of %@", megaFarm.getLandSize("F6"), megaFarm.getCrops("F6").getCropName())
        lbl_Farm7.text = String(format: "%.0f acres of %@", megaFarm.getLandSize("F7"), megaFarm.getCrops("F7").getCropName())
        lbl_Farm8.text = String(format: "%.0f acres of %@", megaFarm.getLandSize("F8"), megaFarm.getCrops("F8").getCropName())
        //TODO: put this in a loop for easier future formating
        
    }
    
    @IBAction func harvestYear(sender: AnyObject) {
        //Set modifier for year
        modifier = e.doEvent()
        
        //Temp Variable for profit
        var temp_profit = megaFarm.harvestAll(modifier)
        
        //Add profit back
        megaFarm.addMoney(temp_profit)
        
        //Increment Year
        yearsPassed++
        
        //Print Year Results
        lbl_harvestMod.text = String(format: "Year: %d \nModifier: %.2f\nReturn: $%.2f", yearsPassed, modifier, temp_profit)
        
        //Refresh Screen (for crops)
        refreshPlay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshPlay()
        lbl_harvestMod.text = String(format: "Year: %d \nModifier: %.2f\nReturn: $%.2f", yearsPassed, modifier, 0.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //Create Destination
        var dest : BuyViewController = segue.destinationViewController as BuyViewController
        
        //Forward Variables
        dest.selectedFarm = self.selectFarm
        dest.farm = megaFarm //Passed by Refrence? So value can be seen by both
    }
    
    @IBAction func unwindFromBuy(unwindSegue: UIStoryboardSegue){
        //When return from other BuyView, Refresh
        refreshPlay()
    }
    
    
    @IBAction func goToBuyScreen(sender: AnyObject) {
        //Decided what farm to send to buyView
        //Might be able to do this in Buy View by having sender forwarded to that view
        switch sender {
            case btn_Farm1 as UIButton: selectFarm = "F1"
            case btn_Farm2 as UIButton: selectFarm = "F2"
            case btn_Farm3 as UIButton: selectFarm = "F3"
            case btn_Farm4 as UIButton: selectFarm = "F4"
            case btn_Farm5 as UIButton: selectFarm = "F5"
            case btn_Farm6 as UIButton: selectFarm = "F6"
            case btn_Farm7 as UIButton: selectFarm = "F7"
            case btn_Farm8 as UIButton: selectFarm = "F8"
            default: selectFarm = "F1"
        }
        
        //DEBUG: Prints selected farm to console
        println(selectFarm)
        
        //Do the segue to buy view
        self.performSegueWithIdentifier("toBuyViewID", sender: self)
        //If we send the button then selection can be in buy view
    }
    

    

}
