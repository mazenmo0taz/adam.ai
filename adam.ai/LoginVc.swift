//
//  LoginVc.swift
//  adam.ai
//
//  Created by mazen moataz on 11/08/2022.
//

import UIKit
class LoginVc: UIViewController {
    
    @IBOutlet weak var userNtextField: UITextField!
    
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var signIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //round corners for textfields and button
        userNtextField.roundCorners([.allCorners],radius: 20)
        pwTextField.roundCorners([.allCorners], radius: 20)
        signIn.roundCorners([.allCorners], radius: 20)
        // placeholder padding for textfields
        userNtextField.placeholderPadding( paddingSize: 36)
        pwTextField.placeholderPadding(paddingSize: 36)
        
    }
    
}


