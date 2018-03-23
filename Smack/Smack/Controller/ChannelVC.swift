//
//  ChannelVC.swift
//  Smack
//
//  Created by Pooya on 1/3/1397 AP.
//  Copyright © 1397 Binogoo. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }


}
