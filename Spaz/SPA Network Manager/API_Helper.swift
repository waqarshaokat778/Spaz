//
//  API_Helper.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 16/08/2022.
//

import Foundation

struct API_Helper {
    //setup url
    let baseUrl = getDomainUrl(app: appEnvoirment()) + "webservices/user/"
    
    //setup api names
    let login = "login"
    let forgotPassword = "forgot_password"
    let getCountryList = "get_country_list"
    let signup = "signup"
    let home = "home"
}

private func getDomainUrl(app: Envoirment) -> String {
    if app == Envoirment.Test {
        return "https://dx.co.ae/spaz/"
    }
    else {
        return "https://dx.co.ae/spaz/"
    }
}
