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
    var acres : Double = 100
    var cropToBuy : Crop = Crop(typeGiven: CropType.Empty, insuredGiven: false)
    //gets price and eventually returns this for setting land value
  
    
    @IBAction func cropUpdate(sender: AnyObject) {
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
    
    @IBAction func changeInsur(sender: AnyObject) {
        isInsured = switchInsur.on
        if(isInsured) {
            labelInsur.text = "You are insured"
        } else {
            labelInsur.text = "You are not insured"
        }
        cropToBuy.setInsured(isInsured)
        updateCalculation()
    }
    
    func clearLabels () {
        changeInsur(self)
        labelCalculation.text = ""
    }
    
    func updateCalculation () {
        labelCalculation.text = String(format: "%@: \nnumber of acres [%.0f] * \nprice of crop [%.2f]", cropToBuy.getCropName(), acres, cropToBuy.getCost())
        labelPrice.text = String(format: "$%.2f",cropToBuy.getCost() * acres)
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
    
    
}
