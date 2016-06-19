//
//  SecondViewController.swift
//  To Do List
//
//  Created by Quan on 6/7/16.
//  Copyright © 2016 KrishApp. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var textInput: UITextField!
    
    //add to list
    @IBAction func addToList(sender: AnyObject) {
        toDo.append(textInput.text!)
        textInput.text = ""
        NSUserDefaults.standardUserDefaults().setObject(toDo, forKey: "toDoList")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textInput.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //keyboard functions
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textInput.resignFirstResponder()
        return true
    }

    

}

