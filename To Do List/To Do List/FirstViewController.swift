//
//  FirstViewController.swift
//  To Do List
//
//  Created by Quan on 6/7/16.
//  Copyright © 2016 KrishApp. All rights reserved.
//

import UIKit

var toDo = [String]()

class FirstViewController: UIViewController, UITableViewDelegate{
    
    @IBOutlet var toDoList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil){
            toDo = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
    }

    //Get row num
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return toDo.count
    }
    
    //Get cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
            cell.textLabel?.text = toDo[indexPath.row]
            return cell
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Swipe delete
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete{
            toDo.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(toDo, forKey: "toDoList")
            toDoList.reloadData()
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
            toDoList.reloadData()
    }
    
    
    
    
    
    


}

