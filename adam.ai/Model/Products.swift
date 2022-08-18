//
//  Products.swift
//  adam.ai
//
//  Created by mazen moataz on 17/08/2022.
//

import Foundation
import RealmSwift
class Prodcuts:Object{
    @objc dynamic var image : NSData = NSData()
    @objc dynamic var name : String?
    @objc dynamic var price : String?
}
