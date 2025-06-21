//
//  LoginViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 08/08/2022.
//

import UIKit

class LoginViewController: SPABase {

    //MARK: IBOutlet Connections
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var iconPass: UIImageView!
    
    //MARK: Constant & Variable
    let loginVM = LoginVM()
    
    var isPass = false
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: Custom Method
    private func loginIntoServer() {
        let param: [String: Any] = [
            "user_email": txtEmail.text ?? "",
            "user_password": txtPassword.text ?? "",
            "user_device_token": constants.deviceToken,
            "user_device_type": constants.deviceType,
            "language": getCurrentLanguage(),
            "device_cart_id": getDeviceId()
        ]
        getAPIResponse(api: API.login, parameter: param, encoding: .default, method: .post) { [self] responseData in
            let login = try? JSONDecoder().decode(LoginAPIModel.self, from: responseData)
            if let loginData = login?.data {
                let encodedData: Data = try! NSKeyedArchiver.archivedData(withRootObject: loginData, requiringSecureCoding: false)
                UserDefaults.standard.set(encodedData, forKey: "loginData")
                push(viewController: MainTabbarViewController.self, storyboard: .MainTabbar)
            }
        }
    }
    
    //MARK: IBAction Methods
    @IBAction func buttonShowHidePasswordClicked(_ sender: Any) {
        if isPass {
            isPass = false
            iconPass.image = UIImage(named: "hidePass")
            txtPassword.isSecureTextEntry = true
        }
        else {
            isPass = true
            iconPass.image = UIImage(named: "showPass")
            txtPassword.isSecureTextEntry = false
        }
    }
    
    @IBAction func btnForgotPasswordClicked(_ sender: Any) {
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        let validate = loginVM.validateLoginFields(email: txtEmail.text ?? "", pass: txtPassword.text ?? "")
        if validate == "success" {
            loginIntoServer()
        }
        else {
            showUserMsg(msg: validate)
        }
    }
    
    @IBAction func btnRegisterClicked(_ sender: Any) {
        push(viewController: RegisterViewController.self, storyboard: .LoginSignup)
    }
    
    @IBAction func btnContinueGoogleClicked(_ sender: Any) {
    }
    
    @IBAction func btnContinueAppleClicked(_ sender: Any) {
    }
    
}
