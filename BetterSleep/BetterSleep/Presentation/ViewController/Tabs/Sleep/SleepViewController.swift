//
//  SleepViewController.swift
//  BetterSleep
//
//  Created by Ahmad Mujahid on 05/11/2022.
//

import UIKit
import HGCircularSlider

class SleepViewController: UIViewController {
   
    // MARK: - IBOutlets
    @IBOutlet weak var goodNightLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var startSleepingBtn: UIButton!
    @IBOutlet weak var sleepingProgress: CircularSlider!
    @IBOutlet weak var astronoutImge: UIImageView!
    @IBOutlet weak var alarmImg: UIImageView!
    @IBOutlet weak var alarmTime: UILabel!
    @IBOutlet weak var timerView: UIView!
    
    // MARK: - Variables
    var timer : Timer?
    var i = 0
    
    // MARK: - Constants
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Navigation Setting
    }
    
    // MARK: - Navigation / IBActions
    
    @IBAction func setTimmerBtnTapped(_ sender: UIButton) {
        timerView.applyEfect(with: timerView.backgroundColor ?? .white)
    }
    
    @IBAction func startSleppingBtnTapped(_ sender: UIButton) {
        self.timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.animateAstronout), userInfo: nil, repeats: true)
        
    }
    
    // MARK: - Custom Funtions
   @objc func animateAstronout() {
       i += 1
       UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseIn, animations: { [self] in
           self.astronoutImge.transform = (self.i % 2 == 0) ? CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2) : CGAffineTransform.identity // Scale your image
        })
    }
}

// MARK: - View Extensions
