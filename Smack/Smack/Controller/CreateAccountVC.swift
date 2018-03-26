//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Pooya on 1/4/1397 AP.
//  Copyright © 1397 Binogoo. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @IBAction func onChooseAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func onGenerateBGColorPressed(_ sender: Any) {
    }
    
    @IBAction func onClosePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCreateAccountPressed(_ sender: Any) {
        
        guard let email = emailText.text , emailText.text != "" else {return}
        guard let password = passwordText.text , passwordText.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: password) { (response) in
            if response {
                print("Registered user!")
                AuthService.instance.loginUser(email: email, password: password, completion: { (response) in
                    if response {
                        print("Logged in user! ", AuthService.instance.authToken)
                        self.performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
                    }
                })
            }
        }
        
    }
    

}
