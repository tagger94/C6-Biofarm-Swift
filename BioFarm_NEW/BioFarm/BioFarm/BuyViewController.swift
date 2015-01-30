//
//  BuyViewController.swift
//  BioFarm
//
//  Created by Jay Staker on 1/24/15.
//
//

import Foundation
import UIKit

class BuyViewController: UIViewController {
    
    // Segment Controller for crop choice
    @IBOutlet var segmentBuyChoice: UISegmentedControl!
    
    // Labels
    @IBOutlet var labelCalculation: UILabel!
    @IBOutlet var labelInsur: UILabel!
    @IBOutlet var labelPrice: UILabel!
    
    // Switch
    @IBOutlet var switchInsur: UISwitch!
    
    // Images
    @IBOutlet var imageCrop: UIImageView!
    
    // Buttons
    @IBOutlet var buttonBuy: UIButton!
    
    // Internal Variables
    var isInsured : Bool = true
    var isBought : Bool = false
   
    
    
    // Values passed from GameView
    var selectedFarm : String = ""
    var acres : Int = 100
    
    // Values to Pass Back to GameView
    var cropToBuy : Crop = Crop() //gets price and eventually returns this for setting land value
    var calculatedCost : Double = 0;
    
    @IBAction func cropUpdate(sender: AnyObject) {
        if(!isBought) {
            switch segmentBuyChoice.selectedSegmentIndex {
                
            case 0: cropToBuy = Crop(typeGiven: CropType.Corn, insuredGiven: isInsured)
            imageCrop.image = UIImage(named: cropToBuy.getSprite())
            switchInsur.hidden = false
            changeInsur(self)
                
                
                
            case 1: cropToBuy = Crop(typeGiven: CropType.Soy, insuredGiven: isInsured)
            imageCrop.image = UIImage(named: cropToBuy.getSprite())
            switchInsur.hidden = false
            changeInsur(self)
                
                
                
            case 2: cropToBuy = Crop(typeGiven: CropType.Grass, insuredGiven: isInsured)
            imageCrop.image = UIImage(named: cropToBuy.getSprite())
            switchInsur.hidden = true
            switchInsur.setOn(false, animated: false) //changes insure switch off since switch grass has no insurance
            changeInsur(self)
                
                
            default: break
            }
        }
        
    }
    
    @IBAction func changeInsur(sender: AnyObject) {
        if(!isBought) {
            isInsured = switchInsur.on
            if(isInsured) {
                labelInsur.text = "You are insured"
            } else {
                labelInsur.text = "You are not insured"
            }
            cropToBuy.setInsured(isInsured)
            updateCalculation()
        }
    }
    
    @IBAction func buy(sender: AnyObject) {
        isBought = true
        buttonBuy.hidden = true
        println(calculatedCost)
        dismissViewControllerAnimated(true, completion: nil)
        // TODO : Find way to segue back to GameView
    }
    
    
    func clearLabels () {
        changeInsur(self)
        labelCalculation.text = ""
    }
    
    func updateCalculation () {
        labelCalculation.text = String(format: "%@: \nnumber of acres [%d] * \nprice of crop [%.2f]", cropToBuy.getCropName(), acres, cropToBuy.getCost())
        calculatedCost = cropToBuy.getCost() * Double(acres)
        labelPrice.text = String(format: "$%.2f", calculatedCost)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cropUpdate(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var dest : GameViewController = segue.destinationViewController as GameViewController
        println("YEAH")
//        if(isBought) {
            // Plants selected crop
            dest.megaFarm.farmLand[selectedFarm]?.plant(cropToBuy)
            // Deducts money
            dest.megaFarm.subMoney(calculatedCost)
//        }
        println(dest.megaFarm.getCash())
        dest.viewDidLoad()
//        dest.refreshPlay() //Does not update over view
        dest.delete(self)
    }
}
