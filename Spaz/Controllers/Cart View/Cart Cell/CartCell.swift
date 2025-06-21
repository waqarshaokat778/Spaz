//
//  CartCell.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 12/08/2022.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var roundedView: SPAView!
    @IBOutlet weak var qtyView: SPAView!
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnPlusQty: UIButton!
    @IBOutlet weak var lblQty: UILabel!
    @IBOutlet weak var btnMinusQty: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
