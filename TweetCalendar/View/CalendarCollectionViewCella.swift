//
//  CalendarCollectionViewCella.swift
//  TweetCalendar
//
//  Created by 築山朋紀 on 2018/12/07.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class CalendarCollectionViewCella: UICollectionViewCell {
    @IBOutlet private var label: UILabel!
    
    func setUp(text: String, at indexPath: IndexPath) {
//        label.text = text
        label.text = " "
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.white.cgColor
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        
        switch arc4random_uniform(5) {
        case 0:
            label.backgroundColor = UIColor(hex: "ebedf0")
        case 1:
            label.backgroundColor = UIColor(hex: "c6e48b")
        case 2:
            label.backgroundColor = UIColor(hex: "7bc96f")
        case 3:
            label.backgroundColor = UIColor(hex: "239a3b")
        case 4:
            label.backgroundColor = UIColor(hex: "196127")
        default: break
        }
        
        //Colorの設定
        if indexPath.row == 0 {
            //indexPath.rowが0のときは日曜日
            label.textColor = .red
        }else if indexPath.row == 6 || indexPath.row == 13 || indexPath.row == 20 || indexPath.row == 27 || indexPath.row == 34 || indexPath.row == 41 {
            //土曜日
            label.textColor = UIColor.blue
        }else if indexPath.row % 7 == 0 {
            //Cell番号が7の倍数の時(日曜日)
            label.textColor = .red
        }else {
            label.textColor = .black
        }
        
        if indexPath.row <= 5 {
            //当月以外の日にちのカラーをグレーに変更する
            if label.text == "25" || label.text == "26" || label.text == "27" || label.text == "28" || label.text == "29" || label.text == "30" || label.text == "31" {
                label.textColor = .gray
            }
        }else if indexPath.row >= 28 {
            //当月以外の日にちのカラーをグレーに変更する
            if label.text == "1" || label.text == "2" || label.text == "3" || label.text == "4" || label.text == "5" || label.text == "6" || label.text == "7" || label.text == "8" || label.text == "9" || label.text == "10" || label.text == "11" || label.text == "12" || label.text == "13" || label.text == "14" {
                label.textColor = .gray
            }
        }
    }
}
