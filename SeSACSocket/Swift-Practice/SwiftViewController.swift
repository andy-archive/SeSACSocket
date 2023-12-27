//
//  SwiftViewController.swift
//  SeSACSocket
//
//  Created by Taekwon Lee on 12/27/23.
//

import UIKit

let age = Int.random(in: 1...100)
let status = false

final class SwiftViewController: UIViewController {
    
    //MARK: - Properties
    private let randomResult = {
        switch age {
        case 1...30:
            return "case below 30"
        case 31...60:
            return "case below 60"
        case 61...100:
            return "case below 100"
        default:
            return "UNKNOWN"
        }
    }()
    
    /* 📝 곧바로 조건문과 함께 변수 할당 가능 */
    private let newResult = if age < 30 { "Student" }
    else if age > 31 && age <= 60 { "Adult" }
    else { "Senior" }
    
    private let userStatus = if status { UIColor.black }
    else { UIColor.red }
    
    //MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue.withAlphaComponent(0.2)
    }
    
    //MARK: - Private Methods
    private func randomAge_SwitchCase() -> String {
        let age = Int.random(in: 1...100)
        
        switch age {
        case 1...30:
            return "case below 30"
        case 31...60:
            return "case below 60"
        case 61...100:
            return "case below 100"
        default:
            return "UNKNOWN"
        }
    }
    private func randomAge_IfElse() -> String {
        let age = Int.random(in: 1...100)
        
        if age <= 30 {
            return "if-else below 30"
        } else if age <= 60 {
            return "if-else below 60"
        } else {
            return "if-else below 100"
        }
    }
}
