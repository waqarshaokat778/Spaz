//
//  BaseViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 10/08/2022.
//

import UIKit
import CoreLocation
import SideMenu
import Localize_Swift
import Toast_Swift
import SDWebImage

class SPABase: UIViewController {

    //MARK: IBInspectable
    @IBInspectable var touchToEndEditing: Bool = true
    @IBInspectable var setNavigationBarHidden: Bool = true
    
    //MARK: Constants & Variables
    let API = API_Helper()
    let constants = SPAConstants()
    let spa = SPAVM()
    let locationManager = CLLocationManager()
    
    var currentLat = Double()
    var currentLng = Double()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initLocationManager()
        initRightMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(setNavigationBarHidden, animated: false)
    }
    
    //MARK: Right Menu
    func initRightMenu() {
        let menu = UIStoryboard.RightMenu.instantiateViewController(withViewClass: RightMenuViewController.self)
        let nav = SideMenuNavigationController(rootViewController: menu)
        nav.menuWidth = self.view.frame.size.width * 0.80
        nav.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.rightMenuNavigationController = nav
        nav.allowPushOfSameClassTwice = false
        nav.presentationStyle = .menuSlideIn
        nav.pushStyle = .default
        nav.statusBarEndAlpha = 0
        nav.presentationStyle.presentingEndAlpha = 0.4
        nav.presentationStyle.onTopShadowColor = UIColor.black
        nav.presentationStyle.onTopShadowOffset = .zero
        nav.presentationStyle.menuStartAlpha = 0.5
        nav.presentationStyle.backgroundColor = UIColor.black
    }
    
    func openRightMenu() {
        guard let menu = SideMenuManager.default.rightMenuNavigationController else { return }
        if parent != nil {
            self.parent?.present(menu, animated: true, completion: nil)
        }
        else {
            self.present(menu, animated: true, completion: nil)
        }
    }
    
    //MARK: UICollectionView Method
    func setupGridLayout(spacing: CGFloat) -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        return layout
    }
    
    func setupCollectionViewFrame(colum: CGFloat, spacing: CGFloat, slider: UICollectionView) -> CGFloat {
        let totalSpacing = (colum * spacing) + ((colum - 1) * spacing) //Amount of total spacing in a row
        let width = (slider.bounds.width - totalSpacing) / colum
        return width
    }
    
    //MARK: Toast
    func showUserMsg(msg:String) {
        self.view.makeToast(msg.localized())
        
    }
    
    //MARK: Custom Methods
    func printInConsole(msg: Any) {
        if isTestEnviorment(app: appEnvoirment()) {
            print(msg)
        }
    }
    
    func showAlertWithConfirmation(msg: String, completion: @escaping()->Void) {
        let alert = UIAlertController(title: constants.appName, message: msg.localized(), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "NO".localized(), style: .cancel))
        alert.addAction(UIAlertAction(title: "YES".localized(), style: .default, handler: {(_: UIAlertAction!) in
            completion()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(msg: String) {
        let alert = UIAlertController(title: constants.appName, message: msg.localized(), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK".localized(), style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    func popBack() {
        navigationController?.popViewController(animated: true)
    }
}
