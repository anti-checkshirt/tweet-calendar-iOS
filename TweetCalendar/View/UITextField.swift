//
//  UITextField.swift
//  TweetCalendar
//
//  Created by 築山朋紀 on 2018/12/08.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

extension UITextField {
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let hoge = bounds.insetBy(dx: 5.0, dy: 5.0)
        self.textRect(forBounds: hoge)
        self.placeholderRect(forBounds: hoge)
        self.editingRect(forBounds: hoge)
    }
}
