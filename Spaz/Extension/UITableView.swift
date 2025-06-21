//
//  UITableView.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 10/08/2022.
//

import UIKit

public protocol ReusableView: AnyObject { }

extension ReusableView where Self: UIView {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView { }
extension UITableViewHeaderFooterView: ReusableView { }

extension UITableView {
    func registerCell<T: UITableViewCell>(cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(aClass: T.Type) {
        register(aClass, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError(" Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError(" Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
        
        
    }
    
    func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue header/footer view with identifier: \(T.reuseIdentifier)")
        }
        return view
    }
}
