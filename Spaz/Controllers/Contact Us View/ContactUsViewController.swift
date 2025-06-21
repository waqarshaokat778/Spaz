//
//  ContactUsViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 12/08/2022.
//

import UIKit

class ContactUsViewController: SPABase {

    //MARK: IBInspectable
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneCode: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtMessage: UITextView!
    
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
