//
//  CheckOutController.swift
//  Spaz
//
//  Created by Abdullah on 8/15/22.
//


import UIKit

class CheckOutController: SPABase {
    
    //MARK: IBInspectable
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tblViewHeight: NSLayoutConstraint!
    @IBOutlet weak var promoView: SPAView!
    
    //MARK: Variable
    var cartData = [[String: String]]()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cartData.append(["name": "Massage 30 Min", "des": "Relax like your life depends on it", "qty": "1"])
        cartData.append(["name": "Hair Spa", "des": "Relax like your life depends on it", "qty": "1"])
        cartData.append(["name": "Love Dale Spa", "des": "Relax like your life depends on it", "qty": "1"])
        promoView.clipsToBounds = true
        tblViewHeight.constant = CGFloat(130 * cartData.count)
    }
    
    //MARK: IBAction Methods
    @IBAction func backBtnClick(_ sender: Any) {
        popBack()
    }
    
    @IBAction func btnBookClicked(_ sender: Any) {
        self.push(viewController: ThankyouViewController.self, storyboard: .OrderFlow)
    }
}
