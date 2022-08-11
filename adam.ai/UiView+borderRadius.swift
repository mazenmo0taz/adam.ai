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
