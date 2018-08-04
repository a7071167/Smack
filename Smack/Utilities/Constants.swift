//
//  Constants.swift
//  Smack
//
//  Created by user on 03.08.2018.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let BASE_URL = "https://smacka.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"




// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

// UserDefaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]
