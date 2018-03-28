//
//  ChannelVC.swift
//  Smack
//
//  Created by Pooya on 1/3/1397 AP.
//  Copyright © 1397 Binogoo. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userImage: CircleImageView!
    
    @IBAction func prepareForUnwind(seque: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
   
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.handleUserDataChanged), name: NOTIFY_USER_DATA_DID_CHANGE, object: nil)
        
    }
    
    @objc func handleUserDataChanged(){
        
        if AuthService.instance.isLoggedIn {
            loginButton.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.backgroundColor = UserDataService.instance.returnUIColor(colorsString: UserDataService.instance.avatarColor)
            
        } else {
            loginButton.setTitle("Login", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
            userImage.backgroundColor = UIColor.clear
        }
        
    }

    @IBAction func onLoginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    
    
    
}
