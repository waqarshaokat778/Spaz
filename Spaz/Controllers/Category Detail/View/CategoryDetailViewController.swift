//
//  CategoryDetailViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 11/08/2022.
//

import UIKit

class CategoryDetailViewController: SPABase {

    //MARK: IBInspectable
    @IBOutlet weak var lblCategoryName: UILabel!
    
    //MARK: Variable
    var favData = [[String: String]]()
    var cat = ""
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        lblCategoryName.text = cat
        
        favData.append(["bg": "fav1", "upper": "favU1"])
        favData.append(["bg": "fav2", "upper": "favU2"])
        favData.append(["bg": "fav3", "upper": "favU3"])
        favData.append(["bg": "fav4", "upper": "favU4"])
    }

    //MARK: IBAction Method
    @IBAction func backClicked(_ sender: Any) {
        popBack()
    }
}
