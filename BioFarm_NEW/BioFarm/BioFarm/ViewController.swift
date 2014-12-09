//
//  ViewController.swift
//  BioFarm
//
//  Created by Berns, Alex J on 12/9/14.
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func helloWorld(sender: UIButton) {
        
        println("Hello World!");
        label.text = "Hello World"
        
    }

}

