//
//  UiView+borderRadius.swift
//  adam.ai
//
//  Created by mazen moataz on 11/08/2022.
//

import Foundation
import UIKit
extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
       }
   
}

extension UITextField{
    func placeholderPadding(paddingSize:CGFloat){
      self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: paddingSize, height: self.frame.height))
      self.leftViewMode = .always
  }
    
}

extension UIColor {

    convenience init(hex: UInt) {
        self.init(hex: hex, alpha: 1.0)
    }

    convenience init(hex: UInt, alpha: CGFloat) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
