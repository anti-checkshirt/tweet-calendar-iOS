//
//  SearchView.swift
//  TweetCalendar
//
//  Created by 築山朋紀 on 2018/12/08.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable class SearchView: UIView {
    
    private let bundleLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 2
        return view
    }()

    private let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    let inputField: UITextField = {
        let input = UITextField()
        input.placeholder = "ユーザーIDを入力"
        input.backgroundColor = .lightGray
        input.layer.cornerRadius = 10
        return input
    }()
    
    required override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(bgView)
        bgView.addSubview(bundleLine)
        bgView.addSubview(inputField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(300)
        }
        
        bundleLine.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.height.equalTo(5)
            make.width.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        inputField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.top.equalTo(15)
            make.height.equalTo(40)
        }
    }
}
