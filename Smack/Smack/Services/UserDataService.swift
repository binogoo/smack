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
    
    func setAvatarName( name: String){
        self.avatarName = name
    }
    
    func returnUIColor(colorsString: String) -> UIColor {
        
        let scanner = Scanner(string: colorsString)
        let toSkipCharacters = CharacterSet(charactersIn: "[], ")
        let splitterCharacter = CharacterSet(charactersIn: ",")
        
        scanner.charactersToBeSkipped = toSkipCharacters
        
        var r, g, b, a: NSString?
        
        scanner.scanUpToCharacters(from: splitterCharacter, into: &r)
        scanner.scanUpToCharacters(from: splitterCharacter, into: &g)
        scanner.scanUpToCharacters(from: splitterCharacter, into: &b)
        scanner.scanUpToCharacters(from: splitterCharacter, into: &a)

        let defaultColor = UIColor.lightGray
        
        guard let rUnwrrapped = r else { return defaultColor }
        guard let gUnwrrapped = g else { return defaultColor }
        guard let bUnwrrapped = b else { return defaultColor }
        guard let aUnwrrapped = a else { return defaultColor }
        
        let rFloat = CGFloat(rUnwrrapped.doubleValue)
        let gFloat = CGFloat(gUnwrrapped.doubleValue)
        let bFloat = CGFloat(bUnwrrapped.doubleValue)
        let aFloat = CGFloat(aUnwrrapped.doubleValue)

        let newColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        
        return newColor
    }
    
}
