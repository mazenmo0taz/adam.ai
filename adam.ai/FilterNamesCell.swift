//
//  FilterNamesCell.swift
//  adam.ai
//
//  Created by mazen moataz on 17/08/2022.
//

import UIKit

class FilterNamesCell: UICollectionViewCell {
    
    @IBOutlet weak var filterName: UILabel!
    override var isSelected: Bool{
        
           didSet {
               if !isSelected {
                self.filterName.textColor =  UIColor.black.withAlphaComponent(0.34)
               } else {
                self.filterName.textColor = UIColor.black
              }
           }
}
}
