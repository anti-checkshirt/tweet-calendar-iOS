//
//  SearchView.swift
//  TweetCalendar
//
//  Created by 築山朋紀 on 2018/12/10.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable class SearchView: UIView {
    
    @objc private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        return view
    }()
    
    private let bundleLine = UIView()
    private let inputFiled = UITextField()
    private let inputUnderLine = UIView()
    private let dateInputUnderLine = UIView()
    private let dateInputField = UITextField()
    private let datepicker = UIDatePicker()

    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        inputFiled.placeholder = "idを入力"
        inputFiled.delegate = self
        dateInputField.placeholder = "xxx年xx月"
        
        inputUnderLine.backgroundColor = .lightGray
        dateInputUnderLine.backgroundColor = .lightGray
        bundleLine.backgroundColor = .lightGray
        bundleLine.layer.cornerRadius = 3.5

        setLayout()
        
        self.addSubview(whiteView)
        whiteView.addSubview(bundleLine)
        whiteView.addSubview(inputFiled)
        inputFiled.addSubview(inputUnderLine)
        whiteView.addSubview(dateInputField)
        dateInputField.addSubview(dateInputUnderLine)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        whiteView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(500)
        }
        
        bundleLine.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(7)
            make.width.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        inputFiled.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(30)
            make.height.equalTo(30)
        }
        
        inputUnderLine.snp.makeConstraints { make in
            make.top.equalTo(inputFiled.snp.bottom).inset(1)
            make.left.right.bottom.equalToSuperview()
        }
        
        dateInputField.snp.makeConstraints { make in
            make.top.equalTo(inputFiled.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(30)
        }
        
        dateInputUnderLine.snp.makeConstraints { make in
            make.top.equalTo(dateInputField.snp.bottom).inset(1)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func setLayout() {
        let timeZone = datepicker.timeZone
        datepicker.timeZone = timeZone
        datepicker.datePickerMode = UIDatePicker.Mode.date
        
        let vi = UIView(frame: datepicker.bounds)
        vi.backgroundColor = UIColor.white
        vi.addSubview(datepicker)
        
        dateInputField.inputView = vi
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        let doneButton   = UIBarButtonItem(title: "決定", style: UIBarButtonItem.Style.done, target: self, action: #selector(SearchView.donePressed))
        let cancelButton = UIBarButtonItem(title: "キャンセル", style: UIBarButtonItem.Style.plain, target: self, action: #selector(SearchView.cancelPressed))
        let spaceButton  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        dateInputField.inputAccessoryView = toolBar
    }
    
    @objc func donePressed() {
        self.endEditing(true)
        dateInputField.text = self.format(date: datepicker.date)
    }
    
    @objc func cancelPressed() {
        dateInputField.text = ""
        self.endEditing(true)
    }
    
    /// Stringに変換
    private func format(date: Date) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy年MM月"
        let strDate = dateformatter.string(from: date)
        return strDate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

extension SearchView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
