//
//  UIImageView.swift
//  Spaz
//
//  Created by Wahyd Pvt Ltd on 17/08/2022.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(url: String) {
        self.sd_setImage(with: URL(string: url), placeholderImage: #imageLiteral(resourceName: "logo"))
    }
}
