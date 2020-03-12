//
//  ViewController.swift
//  TimerApp
//
//  Created by Jumpei Takeshita on 2020/03/12.
//  Copyright © 2020 Jumpei Takeshita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    //setting timer varibable
    var timer = Timer()
    
    //setting count variable
    var count = Int()
    
    //setting array to store the images will be appeard in imageView
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 0
        
        //inactivate the stopbutton at first
        stopButton.isEnabled = false
        
        for i in 0..<5{
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
            
        }
        
        imageView.image = UIImage(named: "0")
        
    }
    

    func startTimer(){
        
        //start timer and call timerUpdate method per 0.2 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
        
    }
    
    //method will be called in startTimer method
    @objc func timerUpdate(){
        
        //count will increse 1 by 1
        count += 1
        
        //loop while number is less than 4
        if count > 4 {
            count = 0
        }else{
            //extract images out of imageArray and putting them into imageView.image
            imageView.image = imageArray[count]
        }
        
    }

    @IBAction func start(_ sender: Any) {
        
        //reflect image to imageView
        startTimer()
        //inactivate the startbutton
        startButton.isEnabled = false
        stopButton.isEnabled = true
    }
    
    @IBAction func stop(_ sender: Any) {
        
        //stop imageView
        
        //activate startbutton
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        //inactivate the stopbutton
        timer.invalidate()
        
    }
    
}

