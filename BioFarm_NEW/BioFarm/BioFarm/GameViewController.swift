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
    @IBOutlet var startButton : UIButton!
    @IBOutlet var farm1Button : UIButton!
    
    @IBAction func start(sender: AnyObject) {
        var farmMoney = Money()
        moneyLabel.text = String(format:"$%.2f", farmMoney.getCash());
    }
    
    func refreshPlay(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}