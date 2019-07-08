//
//  ViewController.swift
//  Stop Watch
//
//  Created by Abshir Mohamed on 7/6/19.
//  Copyright © 2019 Abshir Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var fractionsLabel: UILabel!
    
    var (hours,minutes,seconds,fractions) = (0,0,0,0)
 
    @IBAction func Start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.keepTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func Stop(_ sender: Any) {
        timer.invalidate()
    }
    
    
    @IBAction func Reset(_ sender: Any) {
        timer.invalidate()
        
        (hours,minutes,seconds,fractions) = (0,0,0,0)
        
        timeLabel.text = "00:00:00"
        fractionsLabel.text=".00"
    }
    
    
    @objc func keepTimer() {
        fractions += 1
        if fractions > 99 {
            seconds += 1
            fractions = 0
        }
        if seconds == 60{
            minutes+=1
            seconds = 0
            
        }
        if minutes == 60{
            hours+=1
            minutes = 0
        }
        
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        let hoursString = hours > 9 ? "\(hours)" : "0\(hours)"
        
        timeLabel.text = "\(hoursString):\(minutesString):\(secondsString)"
        
        fractionsLabel.text = ".\(fractions)"
    }
    
}

