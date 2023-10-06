//
//  CustomScreenShotVC.swift
//  ScreenBlockerSwift
//
//  Created by KC on 2023/10/5.
//

import UIKit
import AVKit

class CustomScreenShotVC: UIViewController {
        
    static let identifier = "CustomScreenShotVC"

    var bgView = UIView()
    lazy var pvBgView = ScreenshotPreventingView(contentView: bgView)
    
    fileprivate var playerObserver: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupPlayer()
        
        self.pvBgView.setup(contentView: self.bgView)
        self.pvBgView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.pvBgView)
        
        NSLayoutConstraint(item: self.pvBgView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.pvBgView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.pvBgView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.pvBgView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
    
    deinit {
        guard let observer = playerObserver else { return }
        NotificationCenter.default.removeObserver(observer)
    
        print("===) CustomScreenShotVC deinit.")
    }
    
    func setupPlayer() {
        
        if let videoURL = self.getVideoSourceURL() {
            
            let player = AVPlayer(url: videoURL)
            let playerVC = AVPlayerViewController()
            playerVC.showsPlaybackControls = false // Hide controls
            playerVC.view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            playerVC.player = player
            
            let resetPlayer = {
                playerVC.player?.seek(to: CMTime.zero)
                playerVC.player?.play()
            }
            
            self.playerObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: nil) { notification in
                resetPlayer()
            }
            
            resetPlayer()
                        
            self.addChild(playerVC)
            self.bgView.addSubview(playerVC.view)
            playerVC.didMove(toParent: self)
        }
        
    }
    
    func getVideoSourceURL() -> URL? {
        let url = Bundle.main.url(forResource: "pete", withExtension: "mp4")
        return url
    }
    
}
