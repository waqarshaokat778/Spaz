//
//  ServicesHeaderCell.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 12/08/2022.
//

import UIKit

class ServicesHeaderCell: UITableViewCell {

    @IBOutlet weak var serviceImg: UIImageView!
    @IBOutlet weak var lblServiceName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
