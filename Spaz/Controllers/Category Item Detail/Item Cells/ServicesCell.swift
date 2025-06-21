//
//  ServicesCell.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 12/08/2022.
//

import UIKit

class ServicesCell: UITableViewCell {

    @IBOutlet weak var lblService: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblPerson: UILabel!
    @IBOutlet weak var imgCheck: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
