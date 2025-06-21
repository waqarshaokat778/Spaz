//
//  LoginVM.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 16/08/2022.
//

struct LoginVM {
    
    func validateLoginFields(email: String, pass: String) -> String {
        let spa = SPAVM()
        if email == "" && pass == "" {
            return "Please fill all details!"
        }
        else if email == "" {
            return "Email should not be empty!"
        }
        else if pass == "" {
            return "Password should not be empty!"
        }
        else if !spa.validateEmail(email: email) {
            return "Please enter valid email!"
        }
        else {
            return "success"
        }
    }
}
