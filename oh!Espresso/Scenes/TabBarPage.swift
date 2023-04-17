//
//  TabBarPage.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 15.04.2023.
//

import Foundation

enum TabBarPage {
    case start
    case enterValue
    case instruction

    init?(index: Int) {
        switch index {
        case 0:
            self = .start
        case 1:
            self = .enterValue
        case 2:
            self = .instruction
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .start:
            return "Start"
        case .enterValue:
            return "EnterValue"
        case .instruction:
            return "Instruction"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .start:
            return 0
        case .enterValue:
            return 1
        case .instruction:
            return 2
        }
    }

    // Add tab icon value
    
    // Add tab icon selected / deselected color
    
    // etc
}
