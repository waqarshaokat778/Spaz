//
//  UIViewController + Extension.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 10/08/2022.
//

import UIKit
import Alamofire

extension UIViewController {
    
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        
        return instantiateFromNib()
    }
    
    func push<T: UIViewController>(viewController: T.Type, storyboard: UIStoryboard, configurator: ((T) -> Void)? = nil) {
        let vc:T = storyboard.instantiateViewController(withViewClass: T.self)
        configurator?(vc)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func isTestEnviorment(app: Envoirment) -> Bool {
        if app == Envoirment.Test {
            return true
        }
        else {
            return false
        }
    }
    
    func getDeviceId() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    func getDeviceToken() -> String {
        let cons = SPAConstants()
        return cons.deviceToken
    }
    
    func getCurrentLanguage() -> Int {
        return UserDefaults.standard.value(forKey: "language") as? Int ?? 1
    }
    
    func getLoginToken() -> String {
        let data  = UserDefaults.standard.data(forKey: "loginData") ?? Data()
        let decoded = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? LoginData
        return decoded?.accessToken ?? ""
    }
}
