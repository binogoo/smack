//
//  RoundedButton.swift
//  Smack
//
//  Created by Pooya on 1/7/1397 AP.
//  Copyright © 1397 Binogoo. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius :CGFloat = 3.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        setupViews()
    }
    
    override func prepareForInterfaceBuilder() {
        setupViews()
    }
    
    
    func setupViews() {
        self.layer.cornerRadius = cornerRadius
    }

}
