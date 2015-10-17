//
//  ViewController.swift
//  ImageHop
//
//  Created by csit267-13 on 10/14/15.
//  Copyright (c) 2015 CSIT_267. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bunnyView1: UIImageView!
    @IBOutlet weak var bunnyView2: UIImageView!
    @IBOutlet weak var bunnyView3: UIImageView!
    @IBOutlet weak var bunnyView4: UIImageView!
    @IBOutlet weak var bunnyView5: UIImageView!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var speedStepper: UIStepper!
    @IBOutlet weak var hopsPerSecond: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var customHopSpeed: UITextField!
    
    @IBAction func toggleAnimation(sender: AnyObject) {
        if (bunnyView3.isAnimating()) {
            
            bunnyView1.stopAnimating()
            bunnyView2.stopAnimating()
            bunnyView3.stopAnimating()
            bunnyView4.stopAnimating()
            bunnyView5.stopAnimating()
            toggleButton.setTitle("Hop!", forState: UIControlState.Normal)
        } else {
            bunnyView1.startAnimating()
            bunnyView2.startAnimating()
            bunnyView3.startAnimating()
            bunnyView4.startAnimating()
            bunnyView5.startAnimating()
            toggleButton.setTitle("Stop Hop!", forState: UIControlState.Normal)
        }
    }
    
    @IBAction func setSpeed(sender: AnyObject?) {
        
        bunnyView3.animationDuration = Double(1.0-speedSlider.value)
        bunnyView2.animationDuration = bunnyView3.animationDuration + Double(arc4random_uniform(10))/200.0
        bunnyView4.animationDuration = bunnyView3.animationDuration + Double(arc4random_uniform(10))/200.0
        bunnyView1.animationDuration = bunnyView2.animationDuration + Double(arc4random_uniform(10))/500.0
        bunnyView5.animationDuration = bunnyView4.animationDuration + Double(arc4random_uniform(10))/500.0
        
        bunnyView1.startAnimating()
        bunnyView2.startAnimating()
        bunnyView3.startAnimating()
        bunnyView4.startAnimating()
        bunnyView5.startAnimating()
        
        toggleButton.setTitle("Stop Hop!", forState: UIControlState.Normal)
        
        speedStepper.value=Double(speedSlider.value)
        
        let hopRateString=String(format: "%1.2f hps", 1/(1-self.speedSlider.value))
        hopsPerSecond.text=hopRateString
        
        customHopSpeed.placeholder=hopRateString
        
        
        NSLog(speedStepper.value.description)
        //NSLog(String(bunnyView3.animationDuration))
    }
    
    @IBAction func hideKeyboard(sender: AnyObject) {
        customHopSpeed.resignFirstResponder()
    }
    
    
    @IBAction func enterSpeed(sender: AnyObject) {
        let speed:Double? = Double(customHopSpeed.text!)
        
        if (speed != nil && speed > 0 && speed < 10) {
            
            speedSlider.value=Float((speed!-1)/speed!)
            setSpeed(nil)
        }
        
        
    }
    
    @IBAction func setIncrement(sender: AnyObject) {
        speedSlider.value=Float(speedStepper.value)
        setSpeed(nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let hopAnimation: [UIImage] = [
            UIImage(named: "frame-1")!,
            UIImage(named: "frame-2")!,
            UIImage(named: "frame-3")!,
            UIImage(named: "frame-4")!,
            UIImage(named: "frame-5")!,
            UIImage(named: "frame-6")!,
            UIImage(named: "frame-7")!,
            UIImage(named: "frame-8")!,
            UIImage(named: "frame-9")!,
            UIImage(named: "frame-10")!,
            UIImage(named: "frame-11")!,
            UIImage(named: "frame-12")!,
            UIImage(named: "frame-13")!,
            UIImage(named: "frame-14")!,
            UIImage(named: "frame-15")!,
            UIImage(named: "frame-16")!,
            UIImage(named: "frame-17")!,
            UIImage(named: "frame-18")!,
            UIImage(named: "frame-19")!,
            UIImage(named: "frame-20")!,
            
        ]
        
        bunnyView1.animationImages=hopAnimation
        bunnyView2.animationImages=hopAnimation
        bunnyView3.animationImages=hopAnimation
        bunnyView4.animationImages=hopAnimation
        bunnyView5.animationImages=hopAnimation
        bunnyView1.animationDuration=1.0 //Double(4.0-speedSlider.value)
        bunnyView2.animationDuration=1.0 //Double(4.0-speedSlider.value)
        bunnyView3.animationDuration=1.0 //Double(4.0-speedSlider.value)
        bunnyView4.animationDuration=1.0 //Double(4.0-speedSlider.value)
        bunnyView5.animationDuration=1.0 //Double(4.0-speedSlider.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

