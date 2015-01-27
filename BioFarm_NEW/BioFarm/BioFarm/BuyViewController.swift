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
    
    @IBOutlet var switchGrassButton : UIButton!
    @IBOutlet var farm1Label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buySwitchGrass(sender: AnyObject) {
        if(farm1Label != nil){
            farm1Label.text = "You Just Bought Switch Grass"
        }
    }
    
}
