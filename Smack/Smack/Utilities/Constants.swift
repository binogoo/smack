//
//  Constants.swift
//  Smack
//
//  Created by Pooya on 1/4/1397 AP.
//  Copyright © 1397 Binogoo. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let BASE_URL = "http://localhost:3005/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

// Identifiers
let AVATAR_CELL = "avatarCell"

// Colors
let SMACK_PLACEHOLDER_COLOR = #colorLiteral(red: 0.2078501582, green: 0.2624731064, blue: 0.5810559988, alpha: 0.5)

// Notifications
let NOTIFY_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

// Seques
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND_TO_CHANNEL = "unwindToChannel"
let TO_CHOOSE_AVATAR = "toChooseAvatar"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// Headers
let HEADER = [
    "Content-Type" : "Application/json; charset=utf-8"
]
