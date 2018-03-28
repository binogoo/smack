//
//  CircleImageView.swift
//  Smack
//
//  Created by Pooya on 1/8/1397 AP.
//  Copyright © 1397 Binogoo. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.layer.frame.width / 2
        self.clipsToBounds = true
        
    }
    
    

}
