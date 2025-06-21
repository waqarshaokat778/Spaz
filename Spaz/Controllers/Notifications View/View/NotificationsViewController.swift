//
//  NotificationsViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 10/08/2022.
//

import UIKit

class NotificationsViewController: SPABase {
    
    //MARK: IBInspectable
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: UIView!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBAction Method
    @IBAction func btnMenuClick(_ sender: Any) {
        openRightMenu()
    }
}
