//
//  categsNamesCell.swift
//  adam.ai
//
//  Created by mazen moataz on 11/08/2022.
//

import UIKit

class categsNamesCell: UICollectionViewCell {
    
    @IBOutlet weak var categLabel: UILabel!
    override var isSelected: Bool {
       didSet {
           if isSelected {
               self.backgroundColor = UIColor(hex: 0xFC6B68)
            self.categLabel.textColor =  UIColor.white
           } else {
               self.backgroundColor = UIColor.white
            self.categLabel.textColor = UIColor.black
          }
       }
   }
}
