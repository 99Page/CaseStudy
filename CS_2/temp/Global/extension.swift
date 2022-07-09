//
//  extension.swift
//  temp
//
//  Created by 노우영 on 2022/07/09.
//

import UIKit

extension UIStackView {
    
    func removeAllSubViews() {
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
                    self.removeArrangedSubview(subview)
                    return allSubviews + [subview]
                }
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
