//
//  SearchView.swift
//  TweetCalendar
//
//  Created by 築山朋紀 on 2018/12/08.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import SnapKit

class SearchView: UIView {
    
    private var padding: CGPoint = CGPoint(x: 6.0, y: 0.0)

    let inputField: UITextField = {
        let input = UITextField()
        input.placeholder = "ユーザーIDを入力"
        return input
    }()
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white

        self.addSubview(inputField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        inputField.snp.makeConstraints { make in
            make.top.left.equalTo(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }
    }
}
