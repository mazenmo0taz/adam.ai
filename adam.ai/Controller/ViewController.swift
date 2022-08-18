//
//  ViewController.swift
//  adam.ai
//
//  Created by mazen moataz on 09/08/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpBtn.roundCorners([.allCorners],radius: 20)
        loginBtn.roundCorners([.topRight,.bottomRight], radius: 20)
        
    }


}

