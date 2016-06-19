//
//  ViewController.swift
//  StopWatch
//
//  Created by Quan on 6/6/16.
//  Copyright © 2016 KrishApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time = 0
    var timer = NSTimer()
    
    func result(){
    
        time += 1
        timerLabel.text = String(time)
        
    }
    

    @IBOutlet var timerLabel: UILabel!
    
    @IBAction func play(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.result), userInfo: nil, repeats: true)

    }
   
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
    }
    
    
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        time = 0
        timerLabel.text = "0"
        
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

