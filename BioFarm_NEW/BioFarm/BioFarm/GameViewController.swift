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
    
    @IBOutlet var moneyLabel : UILabel!
    @IBOutlet var farm1Button : UIButton!
    @IBOutlet var switchGrassButton: UIButton!
    @IBOutlet var farm1Label: UILabel!
    
    var farmMoney = Money()
    
    func refreshPlay(){
        if(moneyLabel != nil){
            moneyLabel.text = String(format: "$%.2f", farmMoney.getCash())
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshPlay()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buySwitchGrass(sender: AnyObject) {
        if(farm1Label != nil){
            farm1Label!.text = "You Just Bought Switch Grass"
            farmMoney.cash -= 5000
        }
    }
}
