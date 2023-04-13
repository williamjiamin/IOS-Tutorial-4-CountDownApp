//
//  ViewController.swift
//  countDown
//
//  Created by william on 2023/1/12.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var countDownLabel: UILabel!
    let countDownTime = ["5": 5, "10": 10, "30": 30, "60":60]
    var timer = Timer()
    var totalTime = 0
    var printTime = 0
    
    @IBAction func theTimeSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let secondSelected = sender.currentTitle!
        totalTime = countDownTime[secondSelected]!
        printTime = countDownTime[secondSelected]!
        
        progressBar.progress = 1.0
        
        
        
        print(printTime)
        print(totalTime)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {

        if printTime > 0 {
            countDownLabel.text = "\(printTime) Left"
            progressBar.progress = Float(printTime) / Float(totalTime)
            print(Float(printTime) / Float(totalTime))
            
            printTime -= 1
        } else {
            timer.invalidate()
            countDownLabel.text = "Time is up!"
            progressBar.progress = 0
        }
        
    }
    
}
