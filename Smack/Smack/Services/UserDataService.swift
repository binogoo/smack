//
//  UserDataService.swift
//  Smack
//
//  Created by Pooya on 1/7/1397 AP.
//  Copyright © 1397 Binogoo. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var name = ""
    public private(set) var email = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    
    func setUserData (id: String, name: String, email: String, avatarColor: String, avatarName: String){
        
        self.id = id
        self.name = name
        self.email = email
        self.avatarName = avatarName
        self.avatarColor = avatarColor
        
    }
    
    
    
    
    
}
