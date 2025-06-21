//
//  SideMenuViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 11/08/2022.
//

import UIKit

class RightMenuViewController: SPABase {

    //MARK: IBOutlet
    @IBOutlet weak var bgImg: UIImageView!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bgImg.layer.cornerRadius = 20
        bgImg.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    //MARK: IBAction Methods
    @IBAction func btnHomeClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnAboutClicked(_ sender: Any) {
        self.push(viewController: AboutUsViewController.self, storyboard: .RightMenu)
    }
    
    @IBAction func btnFAQClicked(_ sender: Any) {
        self.push(viewController: FAQsViewController.self, storyboard: .RightMenu)
    }
    
    @IBAction func btnTermsConditionClicked(_ sender: Any) {
        self.push(viewController: TermsConditionViewController.self, storyboard: .RightMenu)
    }
    
    @IBAction func btnPrivacyPolicyClicked(_ sender: Any) {
        self.push(viewController: PrivacyPolicyViewController.self, storyboard: .RightMenu)
    }
    
    @IBAction func btnContactUsClicked(_ sender: Any) {
        self.push(viewController: ContactUsViewController.self, storyboard: .RightMenu)
    }
    
    @IBAction func btnShareClicked(_ sender: Any) {
        self.push(viewController: ShareViewController.self, storyboard: .RightMenu)

    }
}
