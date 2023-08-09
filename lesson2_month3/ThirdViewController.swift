//
//  ThirdViewController.swift
//  lesson2_month3
//
//  Created by User1 on 5/8/23.
//

import UIKit

class ThirdViewController: UIViewController {

    var login: String?
    @IBOutlet weak var loginTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        loginTextField.text = login ?? ""
        // Do any additional setup after loading the view.
    }
    


}
