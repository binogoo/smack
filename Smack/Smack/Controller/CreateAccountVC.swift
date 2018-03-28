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
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    //variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var profileBackgroundColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDataService.instance.avatarName != "" {
            profileImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
        if avatarName.contains("light") && profileBackgroundColor == nil{
            profileImage.backgroundColor = UIColor.gray
        }
    }
    
    func setupView(){
        
        indicator.isHidden = true
        usernameText.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PLACEHOLDER_COLOR])
        emailText.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PLACEHOLDER_COLOR])
        passwordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PLACEHOLDER_COLOR])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
//        self.view.endEditing(true)
//    }
    
    @IBAction func onChooseAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CHOOSE_AVATAR, sender: nil)
    }
    
    @IBAction func onGenerateBGColorPressed(_ sender: Any) {
        let r: CGFloat = CGFloat(arc4random_uniform(255)) / 255
        let g: CGFloat = CGFloat(arc4random_uniform(255)) / 255
        let b: CGFloat = CGFloat(arc4random_uniform(255)) / 255
        
        profileBackgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r), \(g), \(b), 1]"
        
        UIView.animate(withDuration: 2){
            self.profileImage.backgroundColor = self.profileBackgroundColor
        }
        
    }
    
    @IBAction func onClosePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCreateAccountPressed(_ sender: Any) {
        
        indicator.isHidden = false
        indicator.startAnimating()
        
        guard let email = emailText.text , emailText.text != "" else {return}
        guard let password = passwordText.text , passwordText.text != "" else {return}
        guard let name = usernameText.text , usernameText.text != "" else {return}
        
        
        AuthService.instance.registerUser(email: email, password: password) { (response) in
            if response {
                print("Registered user!")
                AuthService.instance.loginUser(email: email, password: password, completion: { (response) in
                    if response {
                        print("Logged in user! ", AuthService.instance.authToken)
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (response) in
                            print("User Added. id: \(UserDataService.instance.id)")
                            self.indicator.isHidden = true
                            self.indicator.stopAnimating()
                            self.performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
                            NotificationCenter.default.post(name: NOTIFY_USER_DATA_DID_CHANGE, object: nil)
                        })
                    }
                })
            }
        }
        
    }
    

}
