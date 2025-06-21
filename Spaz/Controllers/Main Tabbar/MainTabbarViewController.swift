//
//  MainTabbarViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 10/08/2022.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    //MARK: Constants & Variables
    let btnCategory = UIButton(type: .custom)
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var spaTabBarView: UIView = UIView()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateTabbarFrame()
    }
    
    //MARK: Custom Methods
    private func updateTabbarFrame() {
        var bottomOffset: CGFloat = 0
        if view.safeAreaInsets.bottom > 0 {
            bottomOffset = view.safeAreaInsets.bottom
        } else {
            bottomOffset = 32
        }
        tabBar.frame.size.height = tabBar.frame.size.height + bottomOffset
        tabBar.frame.origin.y = tabBar.frame.origin.y - bottomOffset
        spaTabBarView.frame = tabBar.frame
    }
    
    private func setupTabbar() {
        let cons = SPAConstants()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: cons.appColor], for: .selected)
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        
        addCustomTabBarView()
    }

    private func addCustomTabBarView() {
        let imageView = UIImageView(image: UIImage(named: "tabBg"))
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: -8.0)
        imageView.layer.shadowOpacity = 0.10
        imageView.layer.shadowRadius = 10.0
        
        let containerStack = UIStackView(arrangedSubviews: [imageView, bottomView])
        containerStack.axis = .vertical
        
        spaTabBarView = containerStack
        view.addSubview(spaTabBarView)
        view.bringSubviewToFront(self.tabBar)
        
        addCenterItem()
    }
    
    func addCenterItem() {
        btnCategory.layer.masksToBounds = false
        btnCategory.layer.shadowOpacity = 0.4
        btnCategory.layer.shadowColor = UIColor.blue.cgColor
        btnCategory.layer.shadowOffset = CGSize(width: 0, height: 0)
        btnCategory.layer.shadowRadius = 5
        
        btnCategory.addTarget(self, action: #selector(btnCategoryClicked), for: .touchUpInside)
        btnCategory.setBackgroundImage(#imageLiteral(resourceName: "categories").withRenderingMode(.alwaysOriginal), for: .normal)
        btnCategory.translatesAutoresizingMaskIntoConstraints = false
        btnCategory.heightAnchor.constraint(equalToConstant: 70).isActive = true
        btnCategory.widthAnchor.constraint(equalToConstant: 70).isActive = true
        view.addSubview(btnCategory)
        
        view.centerXAnchor.constraint(equalTo: btnCategory.centerXAnchor).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: btnCategory.bottomAnchor, constant: tabBar.frame.size.height - 20).isActive = true
    }
    
    @objc func btnCategoryClicked() {
        self.selectedIndex = 2
    }
}
