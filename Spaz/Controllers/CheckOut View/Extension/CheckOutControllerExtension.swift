//
//  CheckOutControllerExtension.swift
//  Spaz
//
//  Created by Abdullah on 8/15/22.
//

import UIKit

extension CheckOutController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CheckOutCell = tableView.dequeueCell(withType: CheckOutCell.self)
        let cart = cartData[indexPath.row]
        
        cell.roundedView.clipsToBounds = true
        
        cell.lblName.text = cart["name"]
        cell.lblDetail.text = cart["des"]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
