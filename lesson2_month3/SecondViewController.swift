//
//  SecondViewController.swift
//  lesson2_month3
//
//  Created by User1 on 4/8/23.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!

    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var userNameTextFeild: UITextField!

    @IBOutlet weak var passswordTextField: UITextField!

    @IBOutlet weak var confirmPasswordTextFeild: UITextField!
  
    @IBAction func showPasswordButtonPressed(_ sender: Any) {
        passswordTextField.isSecureTextEntry.toggle()
    }
    @IBAction func showConfirmPasswordButtonPressed(_ sender: Any) {
        confirmPasswordTextFeild.isSecureTextEntry.toggle()

    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        if checkFilledFields(){
            let vc = self.storyboard?.instantiateViewController(identifier: "FinalViewController") as! FinalViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func isFilled(tf: UITextField) -> Bool {
        if tf.text?.isEmpty ?? true {
            tf.layer.borderColor = UIColor.red.cgColor
            tf.layer.borderWidth = 1
            tf.placeholder = "Enter a name please"
            
            return false
        } else {
            tf.layer.borderWidth = 0
            return true
        }
        
    }
    
    
    func checkFilledFields () -> Bool{
        let name = isFilled(tf: nameTextField)
        let phoneNumber = isFilled(tf: phoneNumberTextField)
        let email = isFilled(tf: emailTextField)
        let userName = isFilled(tf: userNameTextFeild)
        let password = isFilled(tf: passswordTextField)
        let confirmPassword = isFilled(tf: confirmPasswordTextFeild)
        
        
        if name && phoneNumber && email && userName && password && confirmPassword && checkPssword(password: passswordTextField, confirmPassword: confirmPasswordTextFeild){
            return true
        }
        else{
            return false
        }
    }
    
    func checkPssword(password: UITextField, confirmPassword: UITextField)->Bool{
        if password.text != confirmPassword.text{
            confirmPassword.layer.borderColor = UIColor.red.cgColor
            confirmPassword.layer.borderWidth = 1
            confirmPassword.text=""
            confirmPassword.placeholder = "Wrong password"
            return false
        }else{
            return true
        }
    }
}
