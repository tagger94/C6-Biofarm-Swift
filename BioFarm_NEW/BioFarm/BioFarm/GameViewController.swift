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
    @IBOutlet var lbl_harvestMod: UILabel!
    @IBOutlet var lbl_modiferText: UILabel!
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
    
    //Other Instance Variables
    var selectFarm : String = "F1"
    var masterFarm : Farm = Farm()
    private var e : Event = Event()
    private var modifier: Double = 0.0
    private var eventText: String = "Nothing Here"
    private var yearsPassed : Int = 0;
    
    func refresh(){
        //Debug
        println(masterFarm.getCash())
        
        //Updates the amount of money shown
        lbl_Money.text = String(format: "$%.2f", masterFarm.getCash())
        
        //Update labels for each farm
        lbl_Farm1.text = String(format: "%.0f acres of %@", masterFarm.getLandSize("F1"), masterFarm.getCrops("F1").getCropName())
        lbl_Farm2.text = String(format: "%.0f acres of %@", masterFarm.getLandSize("F2"), masterFarm.getCrops("F2").getCropName())
        lbl_Farm3.text = String(format: "%.0f acres of %@", masterFarm.getLandSize("F3"), masterFarm.getCrops("F3").getCropName())
        lbl_Farm4.text = String(format: "%.0f acres of %@", masterFarm.getLandSize("F4"), masterFarm.getCrops("F4").getCropName())
        lbl_Farm5.text = String(format: "%.0f acres of %@", masterFarm.getLandSize("F5"), masterFarm.getCrops("F5").getCropName())
        lbl_Farm6.text = String(format: "%.0f acres of %@", masterFarm.getLandSize("F6"), masterFarm.getCrops("F6").getCropName())
        lbl_Farm7.text = String(format: "%.0f acres of %@", masterFarm.getLandSize("F7"), masterFarm.getCrops("F7").getCropName())
        lbl_Farm8.text = String(format: "%.0f acres of %@", masterFarm.getLandSize("F8"), masterFarm.getCrops("F8").getCropName())
        //TODO: put this in a loop for easier future formating
        
    }
    
    @IBAction func harvestYear(sender: AnyObject) {
        //Set modifier for year
        (modifier, eventText) = e.doEvent()
        
        //Temp Variable for profit
        var temp_profit = masterFarm.harvestAll(modifier)
        
        //Add profit back
        masterFarm.addMoney(temp_profit)
        
        //Increment Year
        yearsPassed++
        
        //Print Year Results
        lbl_harvestMod.text = String(format: "Year: %d \nModifier: %.2f\nReturn: $%.2f", yearsPassed, modifier, temp_profit)
        
        //print flavor Text
        lbl_modiferText.text = eventText
        
        //Refresh Screen (for crops)
        refresh()
    }
    
    override func viewDidLoad(){
        //what runs when this view is first loaded
        super.viewDidLoad()
        
        //setting default outputs
        self.refresh()
    }

    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //Create Destination
        var dest : BuyViewController = segue.destinationViewController as BuyViewController
        
        //Forward Variables
        dest.selectedFarm = self.selectFarm
        dest.farm = masterFarm //Passed by Refrence? So value can be seen by both
    }
    
    @IBAction func unwindFromBuy(unwindSegue: UIStoryboardSegue){
        //When return from other BuyView, Refresh
        refresh()
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
