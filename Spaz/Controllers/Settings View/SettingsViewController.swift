//
//  SettingsViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 10/08/2022.
//

import UIKit

class SettingsViewController: SPABase {

    //MARK: IBInspectable
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imgProfile.layer.cornerRadius = imgProfile.frame.size.height / 2
        imgProfile.layer.borderWidth = 5
        imgProfile.layer.borderColor = constants.appColor.cgColor
    }

    //MARK: IBAction Methods
    @IBAction func btnOpnRightMenu(_ sender: Any) {
        openRightMenu()
    }
    
    @IBAction func btnEditProfileClicked(_ sender: Any) {
        self.push(viewController: EditProfileViewController.self, storyboard: .MainTabbar)
    }
    
    @IBAction func btnChangePasswordClicked(_ sender: Any) {
        self.push(viewController: ChangePasswordViewController.self, storyboard: .MainTabbar)
    }
    
    @IBAction func btnMyOrdersClicked(_ sender: Any) {
    }
    
    @IBAction func btnLogoutClicked(_ sender: Any) {
        let vc = UIStoryboard.LoginSignup.instantiateViewController(withViewClass: LoginViewController.self)
        self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
    }
}
