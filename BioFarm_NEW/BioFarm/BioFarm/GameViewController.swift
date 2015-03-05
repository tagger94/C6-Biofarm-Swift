//
//  GameViewController.swift
//  BioFarm
//
//  Created by Jay Staker on 1/23/15.
//
//

import Foundation
import UIKit
//import AVFoundation

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
    @IBOutlet var btn_Farm1: OBShapedButton!
    @IBOutlet var btn_Farm2: OBShapedButton!
    @IBOutlet var btn_Farm3: OBShapedButton!
    @IBOutlet var btn_Farm4: OBShapedButton!
    @IBOutlet var btn_Farm5: OBShapedButton!
    @IBOutlet var btn_Farm6: OBShapedButton!
    @IBOutlet var btn_Farm7: OBShapedButton!
    @IBOutlet var btn_Farm8: OBShapedButton!
    @IBOutlet var btn_harvest: UIButton!
    
    //Sounds
    //var sound : AVAudioPlayer?
    
    //Other Instance Variables
    var selectedFarm : Int = 1
    var masterFarm : Farm = Farm()
    private var tempFarm : Farm = Farm()
    private var e : Event = Event()
    private var modifier: Double = 0.0
    private var eventText: String = ""
    private var yearsPassed : Int = 0
    private var profit : Double = 0.0
    
    //System Methods
    override func viewDidLoad(){
        //what runs when this view is first loaded
        super.viewDidLoad()
        
        //setting default outputs
        self.refresh()
        
        setButtonAspect()
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
        super.didReceiveMemoryWarning()
    }
    
    func setButtonAspect() {
        btn_Farm1.imageView?.contentMode = .ScaleAspectFit
        btn_Farm2.imageView?.contentMode = .ScaleAspectFit
        btn_Farm3.imageView?.contentMode = .ScaleAspectFit
        btn_Farm4.imageView?.contentMode = .ScaleAspectFit
        btn_Farm5.imageView?.contentMode = .ScaleAspectFit
        btn_Farm6.imageView?.contentMode = .ScaleAspectFit
        btn_Farm7.imageView?.contentMode = .ScaleAspectFit
        btn_Farm8.imageView?.contentMode = .ScaleAspectFit
    }
    
    //Refresh Methods
    func refresh(){
        //Debug
        println(masterFarm.getCash())
        
        //Updates the amount of money shown
        lbl_Money.text = String(format: "$%.2f", masterFarm.getCash())
        
        //Update labels for each farm
        lbl_Farm1.text = String(format: "%.0f acres of %@", masterFarm.farmLand[1]!.getLandSize(), masterFarm.farmLand[1]!.getCropName())
        lbl_Farm2.text = String(format: "%.0f acres of %@", masterFarm.farmLand[2]!.getLandSize(), masterFarm.farmLand[2]!.getCropName())
        lbl_Farm3.text = String(format: "%.0f acres of %@", masterFarm.farmLand[3]!.getLandSize(), masterFarm.farmLand[3]!.getCropName())
        lbl_Farm4.text = String(format: "%.0f acres of %@", masterFarm.farmLand[4]!.getLandSize(), masterFarm.farmLand[4]!.getCropName())
        lbl_Farm5.text = String(format: "%.0f acres of %@", masterFarm.farmLand[5]!.getLandSize(), masterFarm.farmLand[5]!.getCropName())
        lbl_Farm6.text = String(format: "%.0f acres of %@", masterFarm.farmLand[6]!.getLandSize(), masterFarm.farmLand[6]!.getCropName())
        lbl_Farm7.text = String(format: "%.0f acres of %@", masterFarm.farmLand[7]!.getLandSize(), masterFarm.farmLand[7]!.getCropName())
        lbl_Farm8.text = String(format: "%.0f acres of %@", masterFarm.farmLand[8]!.getLandSize(), masterFarm.farmLand[8]!.getCropName())
        //TODO: put this in a loop for easier future formating
        
    }
    
    func resetImages(){
        btn_Farm1.setImage(nil, forState: btn_Farm1.state)
        btn_Farm2.setImage(nil, forState: btn_Farm2.state)
        btn_Farm3.setImage(nil, forState: btn_Farm3.state)
        btn_Farm4.setImage(nil, forState: btn_Farm4.state)
        btn_Farm5.setImage(nil, forState: btn_Farm5.state)
        btn_Farm6.setImage(nil, forState: btn_Farm6.state)
        btn_Farm7.setImage(nil, forState: btn_Farm7.state)
        btn_Farm8.setImage(nil, forState: btn_Farm8.state)
    }
    
    func refreshImages(){
        var image1 : UIImage = UIImage(named: masterFarm.farmLand[selectedFarm]!.getCropSprite())!
        switch selectedFarm{
            case 1:btn_Farm1.setImage(image1, forState: btn_Farm1.state)
            case 2:btn_Farm2.setImage(image1, forState: btn_Farm2.state)
            case 3:btn_Farm3.setImage(image1, forState: btn_Farm3.state)
            case 4:btn_Farm4.setImage(image1, forState: btn_Farm4.state)
            case 5:btn_Farm5.setImage(image1, forState: btn_Farm5.state)
            case 6:btn_Farm6.setImage(image1, forState: btn_Farm6.state)
            case 7:btn_Farm7.setImage(image1, forState: btn_Farm7.state)
            case 8:btn_Farm8.setImage(image1, forState: btn_Farm8.state)
            default: return//btn_Farm1.setImage(image1, forState: btn_Farm1.state)
        }
        
        //self.btn_Farm3.contentHorizontalAlignment = UIControlContentHorizontalAlignment()
        
    }

    //Methods for Buttons
    @IBAction func harvestYear(sender: AnyObject) {
        //Set modifier for year
        (modifier, eventText) = e.doEvent()
        
        //Temp Variable for profit and tempFarm for results view
        tempFarm = masterFarm.copy()
        profit = masterFarm.harvestAll(modifier)
        
        //Add profit back
        masterFarm.addMoney(profit)
        
        //Increment Year
        yearsPassed++
        
        //Print Year Results
        lbl_harvestMod.text = String(format: "Year: %d \nModifier: %.2f\nReturn: $%.2f", yearsPassed, modifier, profit)
        
        //print flavor Text
        lbl_modiferText.text = eventText
        
        //Refresh Screen (for crops)
        refresh()
        resetImages()
        
       //toResultsView
        self.performSegueWithIdentifier("toResultsView", sender: self)

        //TEST: play applause
//      applause.play()
    }

    @IBAction func goToBuyScreen(sender: AnyObject) {
        //Decided what farm to send to buyView
        //Might be able to do this in Buy View by having sender forwarded to that view
        switch sender {
            case btn_Farm1 as UIButton: selectedFarm = 1
            case btn_Farm2 as UIButton: selectedFarm = 2
            case btn_Farm3 as UIButton: selectedFarm = 3
            case btn_Farm4 as UIButton: selectedFarm = 4
            case btn_Farm5 as UIButton: selectedFarm = 5
            case btn_Farm6 as UIButton: selectedFarm = 6
            case btn_Farm7 as UIButton: selectedFarm = 7
            case btn_Farm8 as UIButton: selectedFarm = 8
            default: selectedFarm = 1
        }
        
        //DEBUG: Prints selected farm to console
        println(selectedFarm)
        
        //Do the segue to buy view
        self.performSegueWithIdentifier("toBuyView", sender: self)
        //If we send the button then selection can be in buy view
    }
    
    //Methods for Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        segue.destinationViewController
        
        //Create Destination
        switch segue.identifier! {
            case "toBuyView":
                var dest : BuyViewController = segue.destinationViewController as BuyViewController
                println("toBuyView")
                dest.selectedFarm = self.selectedFarm
                dest.farm = masterFarm //Passed by Refrence? So value can be seen by both
            case "toResultsView":
                var dest : ResultsTableViewController = segue.destinationViewController as ResultsTableViewController
                println("toResultsView")
                dest.farm = tempFarm //Passed by Refrence? So value can be seen by both
                dest.year = self.yearsPassed
                dest.profit = profit
                dest.mod = modifier
                dest.modText = eventText
            default: break
        }
        
    }
    
    @IBAction func unwindFromBuy(unwindSegue: UIStoryboardSegue){
        //When return from other BuyView, Refresh
        refresh()
        refreshImages()
    }
    
}
