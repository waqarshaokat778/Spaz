//
//  SPAView.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 08/08/2022.
//

import UIKit

class SPAView: UIView {
    
    @IBInspectable public var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.masksToBounds = false
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        get {
            return layer.borderColor == nil ? nil : UIColor(cgColor: layer.borderColor!)
        }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable public var shadowColor: UIColor? {
        get {
            return layer.shadowColor == nil ? nil : UIColor(cgColor: layer.shadowColor!)
        }
        set { layer.shadowColor = newValue?.cgColor }
    }
    
    @IBInspectable public var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    
    @IBInspectable public var shadowOpacity: Float {
        get { return layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    
    @IBInspectable public var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    
    @IBInspectable var isCircle : Bool = false {
        didSet{ layoutSubviews() }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isCircle {
            self.cornerRadius = self.layer.frame.size.height / 2
        }
    }
}


class SPALabel: UILabel {
    
    @IBInspectable public var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.masksToBounds = false
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    
    @IBInspectable var isCircle : Bool = false {
        didSet{ layoutSubviews() }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isCircle {
            self.cornerRadius = self.layer.frame.size.height / 2
        }
    }
}
