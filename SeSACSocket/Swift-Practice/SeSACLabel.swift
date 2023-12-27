//
//  SeSACLabel.swift
//  SeSACSocket
//
//  Created by Taekwon Lee on 12/27/23.
//

import UIKit

final class SeSACLabel: UILabel {
    
    init(
        textColor: UIColor,
        backgroundColor: UIColor
    ) {
        super.init(frame: .zero)
        
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }
    
    init(
        font: UIFont,
        backgroundColor: UIColor
    ) {
        super.init(frame: .zero)
        
        self.font = font
        self.backgroundColor = backgroundColor
    }
    
    /* 👿 문제점: required init을 매번 만들어야 하는가? */
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
