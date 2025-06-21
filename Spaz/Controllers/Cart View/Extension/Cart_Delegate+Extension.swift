//
//  Cart_Delegate+Extension.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 14/08/2022.
//

import UIKit

extension CartController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CartCell = tableView.dequeueCell(withType: CartCell.self)
        let cart = cartData[indexPath.row]
        
        cell.roundedView.clipsToBounds = true
        
        cell.lblName.text = cart["name"]
        cell.lblDetail.text = cart["des"]
        cell.lblQty.text = cart["qty"]
        
        cell.btnPlusQty.tag = indexPath.row
        cell.btnMinusQty.tag = indexPath.row
        cell.btnPlusQty.addTarget(self, action: #selector(btnPlusQtyClicked), for: .touchUpInside)
        cell.btnMinusQty.addTarget(self, action: #selector(btnMinusQtyClicked), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func btnPlusQtyClicked(sender: UIButton) {
        var cart = cartData[sender.tag]
        var qty = Int(cart["qty"] ?? "") ?? 0
        qty = qty + 1
        cart = ["name": cart["name"] ?? "", "des": cart["des"] ?? "", "qty": "\(qty)"]
        cartData.remove(at: sender.tag)
        cartData.insert(cart, at: sender.tag)
        tableView.reloadData()
    }
    
    @objc func btnMinusQtyClicked(sender: UIButton) {
        var cart = cartData[sender.tag]
        var qty = Int(cart["qty"] ?? "") ?? 0
        
        if qty > 1 {
            qty = qty - 1
        }
        
        cart = ["name": cart["name"] ?? "", "des": cart["des"] ?? "", "qty": "\(qty)"]
        cartData.remove(at: sender.tag)
        cartData.insert(cart, at: sender.tag)
        tableView.reloadData()
    }
}
