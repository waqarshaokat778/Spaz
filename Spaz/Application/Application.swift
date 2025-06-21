//
//  AppDelegate.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 08/08/2022.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initNavigationBar()
        IQKeyboardManager.shared.enable = true
        return true
    }
    
    private func initNavigationBar() {
        let cons = SPAConstants()
        let appearance = UIBarButtonItem.appearance()
        appearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        UINavigationBar.appearance().tintColor = cons.appColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : cons.appColor]
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().isTranslucent = true
    }
}

