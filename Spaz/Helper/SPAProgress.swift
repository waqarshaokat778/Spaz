//
//  SPAProgress.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 16/08/2022.
//

import UIKit
import MBProgressHUD

class SPAProgress: NSObject {
    
    //MARK: Constants & Variable
    static let shared: SPAProgress = SPAProgress()
    let cons = SPAConstants()
    
    var hub: MBProgressHUD!
    
    func showProgress(with title: String = "Please wait") {
        DispatchQueue.main.async { [self] in
            hub?.hide(animated: true)
            hub = MBProgressHUD.showAdded(to: UIApplication.shared.windows.filter {$0.isKeyWindow}.first!, animated: true)
            
            hub.label.text = title
            hub.contentColor = .white
            hub.bezelView.color = cons.appColor
            hub.bezelView.blurEffectStyle = .light
        }
    }
    
    func hideProgress() {
        DispatchQueue.main.async { [self] in
            if hub != nil {
                hub?.hide(animated: true)
                hub = nil
            }
        }
    }
}
