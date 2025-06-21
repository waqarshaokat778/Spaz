//
//  HomeView_Delegate+Extension.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 11/08/2022.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == slider {
            return 1
        }
        else {
            return categoriesData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == slider {
            let cell: SliderCollectionViewCell = collectionView.dequeueCell(for: indexPath)
            return cell
        }
        else {
            let cell: CategoriesCollectionViewCell = collectionView.dequeueCell(for: indexPath)
            
            cell.roundedView.clipsToBounds = true
            cell.roundedView.backgroundColor = constants.appColor
            
            cell.lblCategoryName.text = categoriesData[indexPath.item].category_name
            cell.categoryImg.setImage(url: categoriesData[indexPath.item].category_image ?? "")
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.OrderFlow.instantiateViewController(withViewClass: CategoryDetailViewController.self)
        vc.cat = categoriesData[indexPath.item].category_name ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == slider {
            return CGSize(width: slider.frame.size.width, height: slider.frame.size.height)
        }
        else {
            let width = setupCollectionViewFrame(colum: 2, spacing: 10, slider: categorySlider)
            return CGSize(width: width, height: width)
        }
    }
}
