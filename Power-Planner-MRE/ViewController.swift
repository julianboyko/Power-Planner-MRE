//
//  ViewController.swift
//  Power-Planner-MRE
//
//  Created by Julian Boyko on 2020-05-27.
//  Copyright © 2020 Supreme Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var dateCollectionView: UICollectionView!
    var calendarArray: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarArray = CalendarModel.arrayOfDates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        dateCollectionView.selectItem(at: IndexPath.init(item: CalendarModel.CURRENT_DAY, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    // MARK: Collection View Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calendarArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCell
        
        cell.dateLabel.text = calendarArray[indexPath.item] as? String
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}


// This is just to create the date array to populate the dateCollectionView. Has nothing to do with the error at hand
struct CalendarModel {
    
    static let YESTERDAY = 6
    static let CURRENT_DAY = 7
    static let TOMORROW = 8
    
    static func arrayOfDates() -> NSArray {
        let numberOfDays: Int = 14
        let startDate = Date.changeDaysBy(days: -7)
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "EEE d/M/yy"
        
        let calendar = Calendar.current
        var offset = DateComponents()
        var dates: [Any] = [formatter.string(from: startDate)]
        
        for day in 1 ..< numberOfDays {
            offset.day = day
            let nextDay: Date? = calendar.date(byAdding: offset, to: startDate)
            let nextDayString = formatter.string(from: nextDay!)
            
            dates.append(nextDayString)
        }
        return dates as NSArray
    }
}

extension Date {
    static func changeDaysBy(days : Int) -> Date {
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.day = days
        return Calendar.current.date(byAdding: dateComponents, to: currentDate)!
    }
}
