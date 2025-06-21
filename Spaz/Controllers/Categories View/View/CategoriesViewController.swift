//
//  CategoriesViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 10/08/2022.
//

import UIKit

class CategoriesViewController: SPABase {
    
    //MARK: IBInspectable
    @IBOutlet weak var categorySlider: UICollectionView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var topView: UIView!
    
    //MARK: Variable
    var catData = [[String: String]]()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        categorySlider.collectionViewLayout = setupGridLayout(spacing: 10)
        
        catData.append(["bg": "fav2", "txt": "Day Spa"])
        catData.append(["bg": "fav1", "txt": "Health Spa"])
        catData.append(["bg": "fav3", "txt": "Destination Spa"])
        catData.append(["bg": "fav4", "txt": "Health Spa"])
        catData.append(["bg": "fav2", "txt": "Day Spa"])
        catData.append(["bg": "fav1", "txt": "Health Spa"])
        catData.append(["bg": "fav3", "txt": "Destination Spa"])
        catData.append(["bg": "fav4", "txt": "Health Spa"])
    }
    
    //MARK: IBAction Method
    @IBAction func btnMenuClick(_ sender: Any) {
        openRightMenu()
    }
}
