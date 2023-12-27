//
//  SeSACLabel.swift
//  SeSACSocket
//
//  Created by Taekwon Lee on 12/27/23.
//

import UIKit

enum Component {
    case label
    case button
}

protocol UIComponent {
    var component: Component { get }
    var color: UIColor { get set }
    var bgColor: UIColor { get set }
}

final class NewLabel: UILabel, UIComponent {
    var component: Component = .label
    var color: UIColor
    var bgColor: UIColor
    
    init(
        color: UIColor,
        bgColor: UIColor
    ) {
        self.color = color
        self.bgColor = bgColor
        
        super.init(frame: .zero)
        
        self.textColor = color
        self.backgroundColor = bgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct Factory {
    
    static func make(_ component: Component) -> UIComponent {
        switch component {
        case .label:
            return NewLabel(
                color: .black,
                bgColor: .systemYellow
            )
        case .button:
            return NewLabel(
                color: .white,
                bgColor: .systemBlue
            )
        }
    }
}

final class SeSACLabel: UILabel, UIComponent {
    
    var component: Component = .label
    var color: UIColor
    var bgColor: UIColor
    
    init(
        color: UIColor,
        bgColor: UIColor
    ) {
        self.color = color
        self.bgColor = bgColor
        
        super.init(frame: .zero)
        
        self.textColor = color
        self.backgroundColor = bgColor
    }
    
    /* 👿 문제점: required init을 매번 만들어야 하는가? */
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
