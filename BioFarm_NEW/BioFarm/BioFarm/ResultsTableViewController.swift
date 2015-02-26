//
//  ResultsTableViewController.swift
//  BioFarm
//
//  Created by Jay Staker on 2/19/15.
//
//

import Foundation

class ResultsTableViewController: UITableViewController{
    
    var farm: Farm?
    var year: Int = 0
    var profit: Double = 0.0
    var mod: Double = 0.0
    var modText: String = "Error"
    
    //System Methods
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Background Methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 14;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
   
        switch indexPath.row{
            case 0:
                cell.textLabel!.text = String(format: "Year %d", year)
            case 1:
                cell.textLabel!.text = modText
            case 2:
                cell.textLabel!.text = String(format: "Yearly Modifier: %.1f", mod)
            case 3:
                cell.textLabel!.text = "Farms:"
            case 4...11:
                cell.textLabel!.text = String(format:"      %@",farm!.farmLand[indexPath.row - 3]!.getCropName())
            case 12:
                cell.textLabel!.text = String(format: "Profit: $%.2f ", profit)
            case 13:
                cell.textLabel!.text = String(format: "Total Money: $%.2f", farm!.cash)
            default:
                cell.textLabel!.text = "Error"
        }
        
        cell.accessoryType = UITableViewCellAccessoryType.None
        
        return cell
    }
    
}