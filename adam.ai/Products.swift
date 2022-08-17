//
//  Products.swift
//  adam.ai
//
//  Created by mazen moataz on 17/08/2022.
//

import Foundation
import RealmSwift
class Prodcuts:Object{
    @objc var image : Data = Data()
    @objc dynamic var name : String?
    @objc dynamic var price : String?
}
