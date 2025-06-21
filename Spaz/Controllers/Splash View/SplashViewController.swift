//
//  SplashViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 10/08/2022.
//

import UIKit

class SplashViewController: SPABase {
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginToken = getLoginToken()
        if loginToken == "" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.push(viewController: LoginViewController.self, storyboard: .LoginSignup)
            }
        }
        else {
            push(viewController: MainTabbarViewController.self, storyboard: .MainTabbar)
        }
    }
}
