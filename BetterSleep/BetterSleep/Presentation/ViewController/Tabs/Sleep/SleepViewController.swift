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
      
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseIn, animations: {
                
               // HERE
            self.astronoutImge.transform = CGAffineTransform.identity.scaledBy(x: 1.5, y: 1.5) // Scale your image

         }) { (finished) in
             UIView.animate(withDuration: 1, animations: {
               
              self.astronoutImge.transform = CGAffineTransform.identity // undo in 1 seconds

           })
        }
       
    }
    
    // MARK: - Custom Funtions
}

// MARK: - View Extensions
