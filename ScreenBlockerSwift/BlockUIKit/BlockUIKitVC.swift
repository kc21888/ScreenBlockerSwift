//
//  ViewController.swift
//  ScreenBlockerSwift
//
//  Created by KC on 2023/6/26.
//

import UIKit

class BlockUIKitVC: UIViewController {
    
    let sw = UISwitch()
    
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
        self.switchSetting()
    }
    
    deinit {
        print("===) BlockUIKitVC deinit.")
    }
    
    func imageViewSetting () {
        
        let image = UIImage(named: "sea.jpg")
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.image = image
        
        self.pvImageView = ScreenshotPreventingView(contentView: imageView)
        self.pvImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(self.pvImageView)
        
        NSLayoutConstraint(item: self.pvImageView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: self.pvImageView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 45).isActive = true
        NSLayoutConstraint(item: self.pvImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
        NSLayoutConstraint(item: self.pvImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300).isActive = true
    }
    
    func textfieldSetting() {
        
        self.textField.text = "Pete Hu"
        self.textField.layer.borderWidth = 1
        self.textField.layer.borderColor = UIColor.black.cgColor
        self.textField.delegate = self
        
        self.pvTextField = ScreenshotPreventingView(contentView: textField)
        self.pvTextField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(self.pvTextField)
        
        NSLayoutConstraint(item: self.pvTextField, attribute: .top, relatedBy: .equal, toItem: self.pvImageView, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: self.pvTextField, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: self.pvTextField, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
        NSLayoutConstraint(item: self.pvTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 35).isActive = true
    }
    
    func labelSetting() {
        
        self.label.text = self.pvImageView.preventScreenCapture ? "Open Block ScreenShot" : "Close Block ScreenShot"
        self.label.numberOfLines = 0
        self.label.textColor = self.pvImageView.preventScreenCapture ? .red : .black
        
        self.pvLabel = ScreenshotPreventingView(contentView: label)
        self.pvLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(self.pvLabel)
        
        NSLayoutConstraint(item: self.pvLabel, attribute: .top, relatedBy: .equal, toItem: self.pvTextField, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: self.pvLabel, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: self.pvLabel, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -15).isActive = true
        NSLayoutConstraint(item: self.pvLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
    }
    
    func switchSetting() {
        
        self.sw.isOn = pvImageView.preventScreenCapture
        
        self.sw.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sw)
        
        NSLayoutConstraint(item: self.sw, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.sw, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -40).isActive = true
        
        self.sw.addTarget(self, action: #selector(changeSwitch(_:)), for: .valueChanged)
    }
    
    @objc func changeSwitch(_ isSwitch: UISwitch) {
        
        pvImageView.preventScreenCapture = isSwitch.isOn
        pvTextField.preventScreenCapture = isSwitch.isOn
        pvLabel.preventScreenCapture = isSwitch.isOn
        
        self.label.text = self.pvImageView.preventScreenCapture ? "Open Block ScreenShot" : "Close Block ScreenShot"
        self.label.textColor = self.pvImageView.preventScreenCapture ? .red : .black
    }
    
}

extension BlockUIKitVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
