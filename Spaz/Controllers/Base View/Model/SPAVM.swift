//
//  BaseVM.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 10/08/2022.
//

import UIKit

struct SPAVM {
    func validateEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let result = NSPredicate(format:"SELF MATCHES %@", emailRegEx).evaluate(with: email)
        return result
    }
}
