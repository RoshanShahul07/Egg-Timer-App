//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var totalTime = 0
    var timePassed = 0
    var timer = Timer()
    var player : AVAudioPlayer!
    let eggTime = ["Soft":5, "Medium":7, "Hard":10]
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        timer.invalidate()
        let hardeness = sender.currentTitle!
        totalTime = eggTime[hardeness]!
        timePassed = 0
        progressBar.progress = 0.0
        titleLabel.text = hardeness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    @objc func updateTimer()
    {
        if timePassed < totalTime{
            timePassed += 1
            progressBar.progress = Float(timePassed) / Float(totalTime)
        }
        else{
            timer.invalidate()
            titleLabel.text = "Done!!!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                       player = try! AVAudioPlayer(contentsOf: url!)
                       player.play()
        }
    }
    
}
