//  Assignment 3
//  Programmer: Andy Olivares
//  z-id: z1860934
//  class: CSCI 321
//  Due date: 4/10/2020
//  TimerViewController.swift
//  a3
//
//  Created by Andy Olivares on 4/3/20.
//  Copyright © 2020 Andy Olivares. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var TimerPicker: UIDatePicker!       //Timer picker
    @IBOutlet weak var DisplayTimer: UILabel!           //Label to display time remaining
    @IBOutlet weak var StopB: UIBarButtonItem!          //stop button
    @IBOutlet weak var playButton: UIBarButtonItem!     //play button
    var timer = Timer()
    var tracker: Int = 0
    var userSelection: String?
    var isPressedStop = false
    var checkTime = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TimerPicker.countDownDuration = 60                         //sets countdown to 60
        tracker = Int(TimerPicker.countDownDuration)
        StopB.isEnabled = false
        checkTime = Int(TimerPicker.countDownDuration)
        DisplayTimer.text = String(TimerPicker.countDownDuration)
    }
    
    
    /*
     function: startTimer
     usage: starts timer
     -Parameter: none
     -Returns: nothing
     */
    @IBAction func startTimer(_ sender: Any) {
        if(isPressedStop == true && checkTime != Int(TimerPicker.countDownDuration)){
            tracker = Int(TimerPicker.countDownDuration)
            isPressedStop = false
        }
        playButton.isEnabled = false
        StopB.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(decrementTimer), userInfo: nil, repeats: true)
    }
    
    
    /*
     function: decrementTimer
     usage: decrements timer by 1
     -Parameter: none
     -Returns: nothing
     */
    @objc func decrementTimer(){
        tracker -= 1                            //decrements tracker by 1 (seconds)
        DisplayTimer.text = String(tracker)
        if(tracker == 0){                       //checks if seconds is equal to 0
            timer.invalidate()
        }
    }
    
    /*
     function: stopButton
     usage: stops timer
     -Parameter: none
     -Returns: nothing
     */
    @IBAction func stopButton(_ sender: Any) {
        timer.invalidate()
        checkTime = Int(TimerPicker.countDownDuration)  //holds old timerPicker value
        playButton.isEnabled = true                     //shows play button
        StopB.isEnabled = false                         //hides stop button
        isPressedStop = true
    }
    
}

