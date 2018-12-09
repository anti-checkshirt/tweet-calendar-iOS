//
//  CalendarViewController.swift
//  TweetCalendar
//
//  Created by 築山朋紀 on 2018/12/07.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import SnapKit

class CalendarViewController: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView!
    private let searchView = SearchView()
    
    private var calendar = Calendar.current
    private var currentDate = Date()
    private var numberOfItems: Int?
    private var daysPerWeek = 7
    private var currntMonthOfDates = [Date]()
    private var selectedDate = Date()
    private var days = 0
    private var Array = [String]()
    
    private var y = 0
    private var m = 0
    private var d = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        y = year
        m = month
        d = day
        
        self.navigationItem.title = "\(year)年\(month)月"
        
        firstWeek(year: year, month: month)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBAction private func search() {
        showSearch()
    }
    
    private func showSearch() {
        searchView.frame = self.view.bounds
        searchView.frame.origin.y = view.frame.height
        view.addSubview(searchView)
        UIView.animate(withDuration: 0.5) {
            self.searchView.frame.origin.y = self.view.frame.origin.y
        }
    }
}

extension CalendarViewController: UICollectionViewDataSource {
    //Cellの総数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    
    //Cellに値を設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CalendarCollectionViewCella
        cell.setUp(text: Array[indexPath.row], at: indexPath)
        return cell
    }
}

extension CalendarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let returnSize = CGSize(width: collectionView.frame.width / 7.1, height: collectionView.frame.height / 6)
        
        return returnSize
    }
}

extension CalendarViewController {
    private func firstWeek(year: Int, month: Int) {
        guard let august2017 = calendar.date(from: DateComponents(year: year, month: month)) else { return }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        dateFormatter.calendar = calendar
        let yearMonthFomatter = DateFormatter()
        yearMonthFomatter.dateFormat = "yyyy 年 M 月"
        yearMonthFomatter.calendar = calendar
        Array.removeAll()
        self.navigationItem.title = "\(y)年\(month)月"
        
        var components = calendar.dateComponents([.year, .month], from: august2017)
        components.weekOfMonth = 1  //第1週目
        for weekday in 1...7 {
            components.weekday = weekday  // 曜日
            if let date = calendar.date(from: components) {
                Array.append(dateFormatter.string(from: date))
            }
        }
        components.weekOfMonth = 2 //第2週目
        for weekday in 1...7 {
            components.weekday = weekday  // 曜日
            if let date = calendar.date(from: components) {
                Array.append(dateFormatter.string(from: date))
            }
        }
        components.weekOfMonth = 3 //第3週目
        for weekday in 1...7 {
            components.weekday = weekday  // 曜日
            if let date = calendar.date(from: components) {
                Array.append(dateFormatter.string(from: date))
            }
        }
        components.weekOfMonth = 4 //第4週目
        for weekday in 1...7 {
            components.weekday = weekday  // 曜日
            if let date = calendar.date(from: components) {
                Array.append(dateFormatter.string(from: date))
            }
        }
        components.weekOfMonth = 5 //第5週目
        for weekday in 1...7 {
            components.weekday = weekday  // 曜日
            if let date = calendar.date(from: components) {
                Array.append(dateFormatter.string(from: date))
            }
        }
        components.weekOfMonth = 6 //第6週目
        for weekday in 1...7 {
            components.weekday = weekday  // 曜日
            if let date = calendar.date(from: components) {
                Array.append(dateFormatter.string(from: date))
            }
        }
        collectionView.reloadData()
    }
}
