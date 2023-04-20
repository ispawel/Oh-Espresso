//
//  UIColors.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 19.04.2023.
//

import UIKit

class UIColors {
        
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.darkGray,
            UIColor.purple.cgColor,
            UIColor.cyan.cgColor
        ]
        gradient.locations = [0, 0.25, 1]
        return gradient
    }()

}

