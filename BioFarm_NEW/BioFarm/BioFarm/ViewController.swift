//
//  ViewController.swift
//  BioFarm
//
//  Created by Berns, Alex J on 12/9/14.
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbl0: UILabel!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var optionsButton: UIButton!
    @IBOutlet var navigationBar: UINavigationItem!
   
    @IBOutlet var testLabel: UILabel!
   
    @IBOutlet var testButton: UIButton!

    @IBAction func test_1(sender: AnyObject) {
        testLabel.text = ":D"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.titleView?.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func play(sender: AnyObject) {
        
        //let gameView = self.storyboard?.instantiateViewControllerWithIdentifier("Game") as GameViewController
        //self.navigationController?.pushViewController(gameView, animated: true)
        
    }
    
    @IBAction func options(sender: AnyObject) {
        
        //open new options view
        lbl0.text = "Options"
        
    }
    
}

