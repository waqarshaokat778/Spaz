//
//  UIStoryboard.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 10/08/2022.
//

import UIKit

extension UIStoryboard {
    static var Main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    static var LoginSignup: UIStoryboard {
        return UIStoryboard(name: "LoginSignup", bundle: nil)
    }
    
    static var MainTabbar: UIStoryboard {
        return UIStoryboard(name: "MainTabbar", bundle: nil)
    }
    
    static var RightMenu: UIStoryboard {
        return UIStoryboard(name: "RightMenu", bundle: nil)
    }
    
    static var OrderFlow: UIStoryboard {
        return UIStoryboard(name: "OrderFlow", bundle: nil)
    }
    
    func instantiateViewController<T: UIViewController>(withViewClass: T.Type) -> T {
        return self.instantiateViewController(withIdentifier: String(describing: withViewClass.self)) as! T
    }
}
