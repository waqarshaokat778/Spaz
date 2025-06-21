//
//  SelectDateTime_Delegate+Extension.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 15/08/2022.
//

import UIKit
import FSCalendar

extension SelectDateTimeViewController: UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeSlot.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TimeSlotCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        
        cell.lblTime.text = timeSlot[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = setupCollectionViewFrame(colum: 3, spacing: 10, slider: collectionView)
        return CGSize(width: width, height: 48)
    }
}

extension SelectDateTimeViewController: FSCalendarDelegate , FSCalendarDataSource , FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        if Calendar.current.isDateInToday(date) {
            return constants.darkGreen
        } else if  date < Date() {
            return .lightGray
        }
        
        return constants.appColor
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
}
