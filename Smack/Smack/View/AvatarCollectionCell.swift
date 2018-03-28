//
//  AvatarCollectionCell.swift
//  Smack
//
//  Created by Pooya on 1/8/1397 AP.
//  Copyright © 1397 Binogoo. All rights reserved.
//

import UIKit

enum AvatarType {
    case dark
    case light
}

class AvatarCollectionCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func configureCell (index: Int, type: AvatarType){
        if type == AvatarType.dark {
            self.avatarImage.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            self.avatarImage.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
        
        
    }
    
    func setUpView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
    }
    
    
    
}
