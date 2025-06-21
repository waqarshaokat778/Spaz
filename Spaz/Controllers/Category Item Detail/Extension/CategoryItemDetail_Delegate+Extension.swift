//
//  CategoryItemDetail_Delegate+Extension.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 13/08/2022.
//

import UIKit

extension CategoryItemDetailController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = list[indexPath.row]
        
        if data["services"] as? String ?? "" != "" {
            let cell: ServicesHeaderCell = tableView.dequeueCell(withType: ServicesHeaderCell.self)
            
            if indexPath.row > 0 {
                cell.serviceImg.image = UIImage(named: data["img"] as? String ?? "message")
            }
            cell.lblServiceName.text = data["services"] as? String ?? ""
            
            return cell
        }
        else {
            let cell: ServicesCell = tableView.dequeueCell(withType: ServicesCell.self)
            
            cell.lblService.text = data["items"] as? String ?? ""
            cell.lblTime.text = data["time"] as? String ?? ""
            cell.lblPerson.text = data["person"] as? String ?? ""
            cell.lblService.textColor = data["itemColor"] as? UIColor ?? constants.appColor
            cell.lblTime.textColor = data["itemColor"] as? UIColor ?? constants.appColor
            
            if data["isCheck"] as? Bool ?? false == true {
                cell.imgCheck.isHidden = false
            }
            else {
                cell.imgCheck.isHidden = true
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = list[indexPath.row]
        if data["services"] as? String ?? "" != "" {
            return 80
        }
        else {
            serviceHeight = serviceHeight + 50
            servicesViewHeightCons.constant = CGFloat(serviceHeight)
            
            return 50
        }
    }
}

extension CategoryItemDetailController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return therapi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TherapistsCell = collectionView.dequeueCell(for: indexPath)
        
        cell.img.layer.cornerRadius = 10
        cell.img.image = UIImage(named: therapi[indexPath.item])
        
        if indexPath.item == 4 {
            cell.imgCheck.isHidden = false
            cell.img.layer.borderWidth = 1
            cell.img.layer.borderColor = constants.redColor.cgColor
        }
        else {
            cell.imgCheck.isHidden = true
            cell.img.layer.borderWidth = 0
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = setupCollectionViewFrame(colum: 3, spacing: 10, slider: collectionView)
        return CGSize(width: width, height: width * 1.5)
    }
}
