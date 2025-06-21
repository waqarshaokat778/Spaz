//
//  CartController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 12/08/2022.
//

import UIKit

class CartController: SPABase {

    //MARK: IBInspectable
    @IBOutlet weak var vContinueBtn: SPAView!
    @IBOutlet weak var vBillDetailsOuter: UIView!
    @IBOutlet weak var vBillDetailsInner: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tblViewHeight: NSLayoutConstraint!
    
    //MARK: Variable
    var cartData = [[String: String]]()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cartData.append(["name": "Massage 30 Min", "des": "Relax like your life depends on it", "qty": "1"])
        cartData.append(["name": "Hair Spa", "des": "Relax like your life depends on it", "qty": "1"])
        cartData.append(["name": "Love Dale Spa", "des": "Relax like your life depends on it", "qty": "1"])
        
        tblViewHeight.constant = CGFloat(130 * cartData.count)
    }
    
    //MARK: IBAction Methods
    @IBAction func backBtnClick(_ sender: Any) {
        popBack()
    }
    
    @IBAction func continueBtnClick(_ sender: Any) {
        let vc = UIStoryboard.OrderFlow.instantiateViewController(withViewClass: SelectDateTimeViewController.self)
        self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
    }
}
