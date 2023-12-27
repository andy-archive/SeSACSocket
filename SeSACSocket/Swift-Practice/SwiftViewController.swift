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
    
    //MARK: - UI
    private lazy var titleLabel = Factory.make(.label)
    
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
        
        /* 기존 제네릭의 단점: 여러 개를 담지 못함
         -> 따로 담아도 10개까지만
         */
        makeOriginalGeneric(a: 3, b: "Hey")
        makeOriginalGeneric(a: "Hello", b: 3)
        makeOriginalGeneric(a: false, b: "ABC")
        
        /* New Generics */
        let result = makeNewGenericParameterPack(a: 3, 4)
        print(result.0, result.1)
        
    }
    
    //MARK: - Private Methods
    /// switch-case
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
    
    /// if-else
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
    
    /// Generics
    private func makeOriginalGeneric<T, U>(a: T, b: U) {
        print(a, b)
    }
    
    /// Parameter Pack
    ///     Generics with New Features
    ///     "튜플"로 감싸서 반환
    private func makeNewGenericParameterPack<each T>(a: repeat (each T)) -> (repeat each T) {
        return (repeat each a)
    }
    
    /// backDeployed
    /// available과 반대
    //@backDeployed(before: iOS 16.4)
}
