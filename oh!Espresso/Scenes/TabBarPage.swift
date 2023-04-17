//
//  TabBarPage.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 15.04.2023.
//

import Foundation

enum TabBarPage {
    case espresso
    case latte
    case raf

    init?(index: Int) {
        switch index {
        case 0:
            self = .espresso
        case 1:
            self = .latte
        case 2:
            self = .raf
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .espresso:
            return "Espresso"
        case .latte:
            return "Latte"
        case .raf:
            return "Raf"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .espresso:
            return 0
        case .latte:
            return 1
        case .raf:
            return 2
        }
    }

}
