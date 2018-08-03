//
//  GradiantView.swift
//  Smack
//
//  Created by user on 03.08.2018.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

@IBDesignable
class GradiantView: UIView {

    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8509803922, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradiantLayer = CAGradientLayer()
        gradiantLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradiantLayer.startPoint = CGPoint(x: 0, y: 0)
        gradiantLayer.endPoint = CGPoint(x: 1, y: 1)
        gradiantLayer.frame = self.bounds
        self.layer.insertSublayer(gradiantLayer, at: 0)
    }
    

}
