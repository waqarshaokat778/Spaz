//
//  Notifications_Delegate+Extension.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 11/08/2022.
//

import UIKit

extension NotificationsViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NotificationsUITableViewCell = tableView.dequeueCell(withType: NotificationsUITableViewCell.self)
        
        cell.selectionStyle = .none
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
