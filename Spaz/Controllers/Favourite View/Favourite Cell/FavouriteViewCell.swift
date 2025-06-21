//
//  FavouriteViewCell.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 11/08/2022.
//

import UIKit

class FavouriteViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var upperImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
