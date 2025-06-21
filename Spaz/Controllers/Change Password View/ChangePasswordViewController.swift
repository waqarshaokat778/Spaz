//
//  ChangePasswordViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 12/08/2022.
//

import UIKit

class ChangePasswordViewController: SPABase {

    //MARK: IBInspectable
    @IBOutlet weak var txtOldPass: UITextField!
    @IBOutlet weak var txtNewPass: UITextField!
    @IBOutlet weak var txtConfirmPass: UITextField!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: IBAction Methods
    @IBAction func btnBackClicked(_ sender: Any) {
        popBack()
    }
    
    @IBAction func btnSubmitClicked(_ sender: Any) {
    }
}
