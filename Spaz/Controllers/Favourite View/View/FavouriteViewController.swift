//
//  FavouriteViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 10/08/2022.
//

import UIKit

class FavouriteViewController: SPABase {
    
    //MARK: IBInspectable
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: UIView!
    
    //MARK: Variable
    var favData = [[String: String]]()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        favData.append(["bg": "fav1", "upper": "favU1"])
        favData.append(["bg": "fav2", "upper": "favU2"])
        favData.append(["bg": "fav3", "upper": "favU3"])
        favData.append(["bg": "fav4", "upper": "favU4"])
    }
    
    //MARK: IBAction Method
    @IBAction func btnMenuClick(_ sender: Any) {
        openRightMenu()
    }
}
