//
//  SelectDateTimeViewController.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 15/08/2022.
//

import UIKit
import FSCalendar

class SelectDateTimeViewController: SPABase {

    //MARK: IBInspectable
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var timeSlotSlider: UICollectionView!
    @IBOutlet weak var sliderHeight: NSLayoutConstraint!
    
    //MARK: Variable
    var timeSlot = ["08:00 AM", "08:00 AM", "08:00 AM", "08:00 AM", "08:00 AM", "08:00 AM", "08:00 AM", "08:00 AM", "08:00 AM"]
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        timeSlotSlider.collectionViewLayout = setupGridLayout(spacing: 10)
        sliderHeight.constant = (50 * 3) + (10 * 3)
        initCalendar()
        timeSlotSlider.reloadData()
    }
    
    //MARK: Custom Method
    func initCalendar() {
        calendar.delegate = self
        calendar.dataSource = self
        calendar.headerHeight = 4
        calendar.weekdayHeight = 40.0
        calendar.appearance.weekdayFont = .boldSystemFont(ofSize: 17)
        calendar.appearance.weekdayTextColor = constants.redColor
        calendar.appearance.headerTitleColor = .clear
        calendar.appearance.eventDefaultColor = constants.appColor
        calendar.appearance.selectionColor = constants.appColor
        calendar.appearance.titleSelectionColor = .white
        calendar.appearance.headerDateFormat = "yyyy-MM";
        calendar.appearance.titleTodayColor = constants.darkGreen
        calendar.appearance.todayColor = .clear
        calendar.appearance.borderRadius = 1.0
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.titleFont = .systemFont(ofSize: 15, weight: .medium)
        
    }
    
    //MARK: IBAction Methods
    @IBAction func backBtnClick(_ sender: Any) {
        popBack()
    }
    
    @IBAction func btnContinueClicked(_ sender: Any) {
        self.push(viewController: CheckOutController.self, storyboard: .OrderFlow)
    }
}
