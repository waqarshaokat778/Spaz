//
//  EditProfileViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 12/08/2022.
//

import UIKit

class EditProfileViewController: SPABase {

    //MARK: IBInspectable
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var camView: UIView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneCode: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imgProfile.layer.cornerRadius = imgProfile.frame.size.height / 2
        camView.layer.cornerRadius = camView.frame.size.height / 2
    }
    
    //MARK: IBAction Methods
    @IBAction func btnBackClicked(_ sender: Any) {
        popBack()
    }
    
    @IBAction func btnTakePicture(_ sender: Any) {
    }
    
    @IBAction func btnSubmitClicked(_ sender: Any) {
    }
}
