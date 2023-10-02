//
//  ViewController.swift
//  ScreenBlockerSwift
//
//  Created by KC on 2023/6/26.
//

import UIKit

class BlockUIKitVC: UIViewController {
    
    var imageView = UIImageView()
    lazy var pvImageView = ScreenshotPreventingView(contentView: imageView)
    
    var textField = UITextField()
    lazy var pvTextField = ScreenshotPreventingView(contentView: textField)
    
    var label = UILabel()
    lazy var pvLabel = ScreenshotPreventingView(contentView: label)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageViewSetting()
        self.textfieldSetting()
        self.labelSetting()
        
        
    }
    
    deinit {
        
    }
    
    func imageViewSetting () {
     
        let image = UIImage(named: "sea.jpg")
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.image = image
        
        self.pvImageView = ScreenshotPreventingView(contentView: imageView)
        self.pvImageView.translatesAutoresizingMaskIntoConstraints = false
        self.pvImageView.preventScreenCapture = true
        
        view.addSubview(self.pvImageView)
        
        NSLayoutConstraint(item: self.pvImageView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 60).isActive = true
        NSLayoutConstraint(item: self.pvImageView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 45).isActive = true
        NSLayoutConstraint(item: self.pvImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
        NSLayoutConstraint(item: self.pvImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300).isActive = true
    }
    
    func textfieldSetting() {
        
    }
    
    func labelSetting() {
        
    }
    
}
