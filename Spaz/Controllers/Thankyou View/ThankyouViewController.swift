//
//  ThankyouViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 15/08/2022.
//

import UIKit

class ThankyouViewController: SPABase {

    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBAction Method
    @IBAction func btnHomeClicked(_ sender: Any) {
        push(viewController: MainTabbarViewController.self, storyboard: .MainTabbar)
    }
}
