//
//  CheckOutCell.swift
//  Spaz
//
//  Created by Abdullah on 8/15/22.
//

import Foundation
import UIKit

class CheckOutCell: UITableViewCell {

    @IBOutlet weak var roundedView: SPAView!
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
