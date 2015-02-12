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
    @IBOutlet var seg_CropChoice: UISegmentedControl!
    
    // Labels
    @IBOutlet var lbl_Calculation: UILabel!
    @IBOutlet var lbl_Insur: UILabel!
    @IBOutlet var lbl_Price: UILabel!
    
    // Switch
    @IBOutlet var swt_Insur: UISwitch!
    
    // Images
    @IBOutlet var img_Crop: UIImageView!
    
    // Buttons
    @IBOutlet var btn_Buy: UIButton!
    
    
    // Internal Variables
    var isInsured : Bool = true
    //var isBought : Bool = false
    var cropToBuy : Crop = Crop() //gets price and eventually returns this for setting land value
    var calculatedCost : Double = 0;
    
    // Values passed from GameView
    var selectedFarm : String = ""
    var farm : Farm?
    
    @IBAction func cropUpdate(sender: AnyObject) {
        
        switch seg_CropChoice.selectedSegmentIndex {
                
            // Corn
            case 0: cropToBuy = Crop(typeGiven: CropType.Corn, insuredGiven: isInsured)
            swt_Insur.hidden = false
            
            // Soybean
            case 1: cropToBuy = Crop(typeGiven: CropType.Soy, insuredGiven: isInsured)
            swt_Insur.hidden = false
            
            // Switchgrass
            case 2: cropToBuy = Crop(typeGiven: CropType.Grass, insuredGiven: isInsured)
            swt_Insur.hidden = true
            swt_Insur.setOn(false, animated: false) //changes insure switch off since switch grass has no insurance
            
            
            default: break
        }// End Switchcase
        
        //Change Display Sprite
        img_Crop.image = UIImage(named: cropToBuy.getSprite())
        //Update Insur Policy
        changeInsur(self)
        
    }
    
    @IBAction func changeInsur(sender: AnyObject) {
        // Change insur on crop
        cropToBuy.setInsured(swt_Insur.on)
        if(cropToBuy.isInsured()) {
            lbl_Insur.text = "You are insured"
        } else {
            lbl_Insur.text = "You are not insured"
        }
        //Calls update on calculation text field
        updateCalculation()
    }
    
    @IBAction func buy() {
        //Plant Crops and Subtract Money
        if(farm?.getCrops(selectedFarm).getCropName() == "Empty") {
            farm?.subMoney(farm!.plantCrops(selectedFarm, cropToPlant: cropToBuy))
        }
        //Dismiss Popover
        dismissViewControllerAnimated(true, nil)
    }
    
    func updateCalculation () {
        if(farm?.getCrops(selectedFarm).getCropName() == "Empty") {
            lbl_Calculation.text = String(format: "%@: \nnumber of acres %.0f * \nprice of crop %.2f", cropToBuy.getCropName(), farm!.getLandSize(selectedFarm), cropToBuy.getCost())
            calculatedCost = cropToBuy.getCost() * farm!.getLandSize(selectedFarm)
            lbl_Price.text = String(format: "$%.2f", calculatedCost)
        } else {
            lbl_Calculation.text = "Land already purchased"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Check to see if land has been purchased
        if(farm?.getCrops(selectedFarm).getCropName() != "Empty") {
            //Hide objects not used anymore
            seg_CropChoice.hidden = true
            btn_Buy.hidden = true
            swt_Insur.hidden = true
            lbl_Calculation.hidden = true
            
            //Show Price of land
            lbl_Price.text = String(format: "$%.2f", farm!.getCrops(selectedFarm).getCost() * farm!.getLandSize(selectedFarm))
            
            //Set Insure
            if(farm!.getCrops(selectedFarm).isInsured()) {
                lbl_Insur.text = "You are insured"
            } else {
                lbl_Insur.text = "You are not insured"
            }
            
            //Set Crop Image
            img_Crop.image = UIImage(named: farm!.getCrops(selectedFarm).getSprite())
            
        } else {
            cropUpdate(self)
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
