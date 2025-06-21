//
//  RegisterViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 08/08/2022.
//

import UIKit
import ADCountryPicker

class RegisterViewController: SPABase {
    
    //MARK: IBOutlet Connections
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var iconPass: UIImageView!
    @IBOutlet weak var txtConfirmPass: UITextField!
    @IBOutlet weak var iconConfirmPass: UIImageView!
    @IBOutlet weak var iconCheckBox: UIImageView!
    @IBOutlet weak var lblCountryCode: UILabel!
    
    //MARK: Variable
    var isPass = false
    var isConfrimPass = false
    var isCheck = false
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: Custom Method
    private func loadCountryCode() {
        let picker = ADCountryPicker(style: .grouped)
        picker.showCallingCodes = true
        picker.showFlags = true
        
        // or closure
        picker.didSelectCountryClosure = { name, code in
            _ = picker.navigationController?.popToRootViewController(animated: true)
            print(code)
        }
        
        picker.didSelectCountryWithCallingCodeClosure = { name, code, dail in
            self.lblCountryCode.text = dail
            self.dismiss(animated: true)
        }
        
        let pickerNavigationController = UINavigationController(rootViewController: picker)
        self.present(pickerNavigationController, animated: true, completion: nil)
        
    }
    
    //MARK: IBAction Methods
    @IBAction func btnDropDownClicked(_ sender: Any) {
        loadCountryCode()
    }
    
    @IBAction func btnShowHidePasswordClicked(_ sender: Any) {
        if isPass {
            isPass = false
            iconPass.image = UIImage(named: "hidePass")
            txtPass.isSecureTextEntry = true
        }
        else {
            isPass = true
            iconPass.image = UIImage(named: "showPass")
            txtPass.isSecureTextEntry = false
        }
    }
    
    @IBAction func btnShowHideConfirmPasswordClicked(_ sender: Any) {
        if isConfrimPass {
            isConfrimPass = false
            iconConfirmPass.image = UIImage(named: "hidePass")
            txtConfirmPass.isSecureTextEntry = true
        }
        else {
            isConfrimPass = true
            iconConfirmPass.image = UIImage(named: "showPass")
            txtConfirmPass.isSecureTextEntry = false
        }
    }
    
    @IBAction func btnCheckBoxClicked(_ sender: Any) {
        if isCheck {
            isCheck = false
            iconCheckBox.image = UIImage(named: "checkBoxUnCheck")
        }
        else {
            isCheck = true
            iconCheckBox.image = UIImage(named: "checkBoxCheck")
        }
    }
    
    @IBAction func btnTermsConditionClicked(_ sender: Any) {
    }
    
    @IBAction func btnRegisterClicked(_ sender: Any) {
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        popBack()
    }
}
