//
//  CategoryItemDetailController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 12/08/2022.
//

import UIKit

class CategoryItemDetailController: SPABase {

    //MARK: IBInspectable
    @IBOutlet weak var topImg: UIImageView!
    @IBOutlet weak var imgCat: UIImageView!
    @IBOutlet weak var servicesViewHeightCons: NSLayoutConstraint!
    @IBOutlet weak var therapistsViewHeightCons: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variable
    var list = [[String: Any]]()
    var therapi = ["therapi1", "therapi2", "therapi3", "therapi4", "therapi5", "therapi6"]
    var serviceHeight = 130
    var therapistsHeight = 65
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = setupGridLayout(spacing: 10)
        
        let width = setupCollectionViewFrame(colum: 3, spacing: 10, slider: collectionView)
        therapistsHeight = therapistsHeight + Int(width * 1.5) * 2
        therapistsViewHeightCons.constant = CGFloat(therapistsHeight)
        
        list.append(["services": "Massages", "img": "message"])
        list.append(["items": "Massage", "time": "30min", "person": "", "itemColor": constants.redColor, "isCheck": true])
        list.append(["items": "Massage", "time": "30min", "person": "", "itemColor": constants.appColor, "isCheck": false])
        list.append(["items": "Massage", "time": "30min", "person": "", "itemColor": constants.appColor, "isCheck": false])
        list.append(["items": "Massage", "time": "30min", "person": "", "itemColor": constants.appColor, "isCheck": false])
        list.append(["items": "Massage", "time": "4 Hands", "person": "(2 Girls)", "itemColor": constants.appColor, "isCheck": false])
        list.append(["services": "Other Services", "img": "spaService"])
        list.append(["items": "Hair Spa", "time": "", "person": "", "itemColor": constants.redColor, "isCheck": true])
        list.append(["items": "Back Pain Treatment", "time": "", "person": "", "itemColor": UIColor.darkGray, "isCheck": false])
    }
    
    //MARK: IBAction Methods
    @IBAction func backBtnClick(_ sender: Any) {
        popBack()
    }
    
    @IBAction func continueBtnClick(_ sender: Any) {
        self.push(viewController: CartController.self, storyboard: .OrderFlow)
    }
}


