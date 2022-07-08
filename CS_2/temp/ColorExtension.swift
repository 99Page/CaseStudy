//
//  ColorExtension.swift
//  temp
//
//  Created by 노우영 on 2022/07/08.
//

import Foundation
import UIKit

enum AssetColor {
    case StarBucksGreen
}

extension UIColor {
    static func appColor(_ name: AssetColor) -> UIColor {
        
        switch name {
        case .StarBucksGreen:
            return #colorLiteral(red: 0.01192706171, green: 0.5535718799, blue: 0.3244476318, alpha: 1)
        }
    }
}
