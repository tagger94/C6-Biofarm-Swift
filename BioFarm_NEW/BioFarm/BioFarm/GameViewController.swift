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
    @IBOutlet var farm1Label: UILabel!
    @IBOutlet var labelFarm1Price: UILabel!
    
//    var farmMoney = Money()
    
    var selectFarm : String = "F3"
    
    var megaFarm : Farm = Farm()
    
    func refreshPlay(){
        // moneyLabel.text = String(format: "$%.2f", farmMoney.getCash())
        println(megaFarm.getCash())
        moneyLabel.text = String(format: "$%.2f", megaFarm.getCash())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshPlay()
        // Do any additional setup after loading the view, typically from a nib.
        //        labelFarm1Price.text = String(format: "%.2f", megaFarm.)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var dest : BuyViewController = segue.destinationViewController as BuyViewController
        dest.acres = (megaFarm.farmLand[selectFarm]?.getSize())!
        dest.selectedFarm = self.selectFarm
        //        dest.acres = megaFarm.farmLand["F1"].getSize()
        //        dest.acres = 100
    }

}
