//
//  ViewController.swift
//  searchWord
//
//  Created by 俞佳兴 on 2019/1/27.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ViewController: UIViewController, UITextFieldDelegate {
    let textField = SkyFloatingLabelTextField(frame: CGRect(x: 40, y: 40, width: 200, height: 45))
    let darkGreyColor = UIColor(red: 52/255, green: 42/255, blue: 61/255, alpha: 1.0)
    let lightGreyColor = UIColor(red: 197/255, green: 205/255, blue: 205/255, alpha: 1.0)
    let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField.delegate = self
        textField.placeholder = "Word"
        textField.title = "Word you want to search"
        textField.tintColor = overcastBlueColor
        textField.textColor = darkGreyColor
        textField.lineColor = lightGreyColor
        textField.selectedTitleColor = overcastBlueColor
        textField.selectedLineColor = overcastBlueColor
        textField.lineHeight = 1.0
        textField.selectedLineHeight = 2.0
        textField.center = self.view.center
        textField.textAlignment = .center
        self.view.addSubview(textField)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.textAlignment = .left
        let moveUpTransform = CGAffineTransform.init(translationX: 0, y: -(self.view.bounds.height / 2 - 80))
        UIView.animate(withDuration: 0.5) {
            self.textField.transform = moveUpTransform
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.textAlignment = .center
        if textField.text == "" {
            UIView.animate(withDuration: 0.5) {
                self.textField.transform = .identity
            }
            return true
        }
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
        if textField.text == "" {
            UIView.animate(withDuration: 0.5) {
                self.textField.transform = .identity
            }
        }
        textField.textAlignment = .center
    }


}

