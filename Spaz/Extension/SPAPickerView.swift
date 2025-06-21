//
//  SPAPickerView.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 10/08/2022.
//

import UIKit

public enum SPAPickerType {
    case StringPicker
    case DatePicker
}

/// MARK:- SPAPickerView
class SPAPickerView: UITextField {
    
    var pickerType: SPAPickerType? {
        
        didSet {
            guard let type = pickerType else {
                return
            }
            
            switch type {
            case .DatePicker:
                datePicker = UIDatePicker()
                break
            case .StringPicker:
                stringPicker = UIPickerView()
                stringPicker?.delegate = self
                stringPicker?.dataSource = self
                stringPicker?.reloadAllComponents()
                break
            }
            
            inputAccessoryView = toolbar
        }
    }
    
    // For DatePicker
    var dateFormatter = DateFormatter()
    var dateDidChange: ((Date) -> Void)?
    
    var datePicker: UIDatePicker? {
        get {
            return self.inputView as? UIDatePicker
        }
        set {
            inputView = newValue
            dateFormatter.dateFormat = "MM/dd/YYYY"
       }
    }
    
    // For String Picker
    var stringPickerData: [String]? {
        willSet {
            stringPicker?.reloadAllComponents()
        }
    }
    
    var stringDidChange: ((Int) -> Void)?
    
    var pickerRow: UILabel {
        let pickerLabel = UILabel()
        //pickerLabel.textColor = .black
        pickerLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        pickerLabel.textAlignment = .center
        pickerLabel.sizeToFit()
        return pickerLabel
    }
    
    var stringPicker: UIPickerView? {
        get {
            return self.inputView as? UIPickerView
        }
        set {
            inputView = newValue
        }
    }
    
    // Configurations
    var toolbar: UIToolbar {
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = false
        //toolBar.barTintColor = .bar
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(doneAction))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                          target: nil,
                                          action: nil)
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel,
                                           target: self,
                                           action: #selector(cancelAction))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        inputAccessoryView = toolBar
        return toolBar
    }
    
    @objc func doneAction() {
        
        guard let type = pickerType else {
            return
        }
        
        switch type {
        case .DatePicker:
            
            let date = datePicker!.date
            self.text = dateFormatter.string(from: date)
            
            dateDidChange?(date)
            
            break
        case .StringPicker:
            let row = stringPicker!.selectedRow(inComponent: 0)
            if let selectedRow = stringPickerData?[row] {
                self.text = selectedRow
                stringDidChange?(row)
            } else {
                self.text = ""
            }
            
            stringDidChange?(row)
            
            break
            
        }
        
        resignFirstResponder()
    }
    
    @objc func cancelAction() {
        resignFirstResponder()
    }
    
}

//MARK: UIPickerViewDelegate
extension SPAPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stringPickerData?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = pickerRow
        
        
        label.text = stringPickerData?[row] ?? ""
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let selectedRow = stringPickerData?[row] {
            self.text = selectedRow
            stringDidChange?(row)
        } else {
            self.text = ""
        }
        //resignFirstResponder()
    }
}


