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
    
    var (hours,minutes,seconds,fractions) = (0,0,0,0)
    
    @IBOutlet weak var time: UILabel!
    
    @IBAction func Start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.keepTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func Stop(_ sender: UIButton) {
        
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        (hours,minutes,seconds,fractions) = (0,0,0,0)
        
        time.text = "\(hours):\(minutes):\(seconds)\(fractions)"
    }
    
    func keepTimer(){
        fractions += 1
        if fractions > 99 {
            seconds += 1
            fractions = 0
        }
        if seconds == 60{
            minutes+=1
            seconds = 0
            
        }
        if minutes==60{
            hours+=1
            minutes = 0
        }
        
        time.text = "\(hours):\(minutes):\(seconds)\(fractions)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

