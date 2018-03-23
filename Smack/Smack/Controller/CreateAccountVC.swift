//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Pooya on 1/4/1397 AP.
//  Copyright © 1397 Binogoo. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onClosePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCreateAccountPressed(_ sender: Any) {
        
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
        
    }
    

}
