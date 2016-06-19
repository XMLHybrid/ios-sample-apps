//
//  ViewController.swift
//  Times Tables
//
//  Created by Quan on 6/7/16.
//  Copyright © 2016 KrishApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{

    @IBOutlet var tableView: UITableView!
    @IBOutlet var slider: UISlider!
    
    @IBAction func sliderAction(sender: AnyObject) {
        
tableView.reloadData()    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 20;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        let timesTable = Int(slider.value * 20)
        cell.textLabel?.text = String(timesTable * indexPath.row);
        return cell;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}

