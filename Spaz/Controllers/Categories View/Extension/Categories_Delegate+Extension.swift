//
//  Categories_Delegate+Extension.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 11/08/2022.
//

import UIKit

extension CategoriesViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoriesCell = collectionView.dequeueCell(for: indexPath)
        let data = catData[indexPath.row]
        
        cell.roundedView.clipsToBounds = true
        cell.categoryImg.layer.cornerRadius = 20
        cell.categoryImg.image = UIImage(named: data["bg"] ?? "")
        cell.lblCategoryName.text = data["txt"]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.push(viewController: CategoryItemDetailController.self, storyboard: .OrderFlow)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = setupCollectionViewFrame(colum: 2, spacing: 10, slider: categorySlider)
        return CGSize(width: width, height: width * 1.1)
    }
}
