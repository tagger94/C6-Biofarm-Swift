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
    @IBOutlet var btn_Buy: OBShapedButton!
    
    // Internal Variables
    var isInsured : Bool = true
    //var isBought : Bool = false
    var cropToBuy : CropType = CropType.Empty //gets price and eventually returns this for setting land value
    var calculatedCost : Double = 0;
    
    // Values passed from GameView
    var selectedFarm : Int = 1
    var farm : Farm?
    
    //System Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Check to see if land has been purchased
        if(farm?.farmLand[selectedFarm]!.getCropName() != "Empty") {
            //Hide objects not used anymore
            seg_CropChoice.hidden = true
            btn_Buy.hidden = true
            swt_Insur.hidden = true
            lbl_Calculation.hidden = true
            
            //Show Price of land
            lbl_Price.text = String(format: "$%.2f", farm!.farmLand[selectedFarm]!.getCropCost() *
                                    farm!.farmLand[selectedFarm]!.getLandSize())
            
            //Set Insure
            if(farm!.farmLand[selectedFarm]!.isInsured()) {
                lbl_Insur.text = "You are insured"
            } else {
                lbl_Insur.text = "You are not insured"
            }
            
            //Set Crop Image
            img_Crop.image = UIImage(named: farm!.farmLand[selectedFarm]!.getCropSprite())
            
        } else {
            cropUpdate(self)
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //GUI Methods
    @IBAction func cropUpdate(sender: AnyObject) {
        
        switch seg_CropChoice.selectedSegmentIndex {
                
            // Corn
            case 0: cropToBuy = CropType.Corn
            swt_Insur.hidden = false
            
            // Soybean
            case 1: cropToBuy = CropType.Soy
            swt_Insur.hidden = false
            
            // Switchgrass
            case 2: cropToBuy = CropType.Grass
            swt_Insur.hidden = true
            swt_Insur.setOn(false, animated: false) //changes insure switch off since switch grass has no insurance
            
            
            default: break
        }// End Switchcase
        
        //Change Display Sprite
        farm!.farmLand[selectedFarm]!.setCrop(cropToBuy)
        img_Crop.image = UIImage(named: farm!.farmLand[selectedFarm]!.getCropSprite())
        
        //Update Insur Policy
        changeInsur(self)
        
    }
    
    @IBAction func changeInsur(sender: AnyObject) {
        // Change insur on crop
        isInsured = swt_Insur.on
        if(isInsured) {
            lbl_Insur.text = "You are insured"
        } else {
            lbl_Insur.text = "You are not insured"
        }
        
        //Calls update on calculation text field
        updateCalculation()
    }
    
    @IBAction func buy() {
        //Plant Crops and Subtract Money
        if(farm!.farmLand[selectedFarm]!.getCropName() != "Empty") {
            farm!.subMoney(farm!.farmLand[selectedFarm]!.plant(cropToBuy))
        }
        //Dismiss Popover
        dismissViewControllerAnimated(true, nil)
    }
    
    //Background Methods
    func updateCalculation () {
        if(farm!.farmLand[selectedFarm]!.getCropName() != "Empty") {
            //values used in method
            let cost = farm!.farmLand[selectedFarm]!.getCropCost()
            let size = farm!.farmLand[selectedFarm]!.getLandSize()
            let name = farm!.farmLand[selectedFarm]!.getCropName()
            
            lbl_Calculation.text = String(format: "%@: \nnumber of acres %.0f * \nprice of crop %.2f", name, size, cost)
            calculatedCost = cost * size
            lbl_Price.text = String(format: "$%.2f", calculatedCost)
        } else {
            lbl_Calculation.text = "Land already purchased"
        }
    }

}
