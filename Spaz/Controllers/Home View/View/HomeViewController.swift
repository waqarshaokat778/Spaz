//
//  HomeViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 10/08/2022.
//

import UIKit
import CHIPageControl

class HomeViewController: SPABase {

    //MARK: IBInspectable
    @IBOutlet weak var lblCurrentLocation: UILabel!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var slider: UICollectionView!
    @IBOutlet weak var pageControl: CHIPageControlJaloro!
    @IBOutlet weak var categorySlider: UICollectionView!
    @IBOutlet weak var categorySliderHeight: NSLayoutConstraint!
    
    //MARK: Variables
    var sliderData = [Slider]()
    var categoriesData = [Service_categories]()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getHomeData()
        categorySliderHeight.constant = categorySlider.collectionViewLayout.collectionViewContentSize.height
        categorySlider.collectionViewLayout = setupGridLayout(spacing: 10)
    }
    
    private func getHomeData() {
        let param: [String: Any] = [
            "access_token": getLoginToken(),
            "device_cart_id": getDeviceId(),
            "language": getCurrentLanguage(),
        ]
        getAPIResponse(api: API.home, parameter: param, encoding: .default, method: .post) { [self] responseData in
            let home = try? JSONDecoder().decode(HomeAPIModel.self, from: responseData)
            sliderData = home?.data?.slider ?? [Slider]()
            categoriesData = home?.data?.service_categories ?? [Service_categories]()
            slider.reloadData()
            categorySlider.reloadData()
        }
    }
    
    //MARK: IBAction Methods
    @IBAction func btnLocationClicked(_ sender: Any) {
    }
    
    @IBAction func btnMenuClicked(_ sender: Any) {
        openRightMenu()
    }
}
