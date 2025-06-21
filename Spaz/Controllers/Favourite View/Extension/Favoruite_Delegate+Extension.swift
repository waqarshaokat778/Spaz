//
//  Favoruite_Delegate+Extension.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 11/08/2022.
//

import UIKit

extension FavouriteViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteViewCell", for: indexPath) as! FavouriteViewCell
        let data = favData[indexPath.row]
        
        cell.bgImg.layer.cornerRadius = 20
        cell.bgImg.image = UIImage(named: data["bg"] ?? "")
        cell.upperImg.image = UIImage(named: data["upper"] ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.push(viewController: CategoryItemDetailController.self, storyboard: .OrderFlow)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
