//
//  HomeDetailViewController.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 05/07/2023.
//

import UIKit
import AVFoundation

class HomeDetailViewController: BSBaseViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    
    // MARK: - Variables
    var viewModel: HomeDetailViewModel?
    var player: AVAudioPlayer?
    // MARK: - Constants
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        subcribeItem()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.containerView.fadeIn()
        }
        
        // Navigation Setting
    }
    
    // MARK: - Navigation / IBActions
    
    @IBAction func playBtnTapped(_ sender: UIButton) {
        let _url = "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/55/59/0b/55590b26-5346-194c-47e9-2048f65c643e/mzaf_4245740279345196863.plus.aac.ep.m4a"
        
        if let url = URL(string: BetterSleepManager.shared.filePath) {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("\(error.localizedDescription)")
            }
           
        } else {
            print("invalid url")
        }

        
      
        
    }
    // MARK: - Custom Funtions
    func subcribeItem() {
        guard let viewModel = viewModel else { return }
        viewModel.item
            .observe(on: mainScheduler)
            .subscribe(onNext: { [unowned self] data in
                imageView.setImage(data.icon)
                detailLbl.text = data.detail
                titleLbl.text = data.title
            }).disposed(by: disposeBag)
    }
    
}

// MARK: - View Extensions
