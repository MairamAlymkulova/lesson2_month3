

import UIKit
import SnapKit

class ViewController: UIViewController {
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailTextFieldView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    var isChecked: Bool = true
    
    
    @IBAction func showPasswordButtonPressed(_ sender: Any) {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    
    @IBAction func forgotPasswordButtonPresssed(_ sender: Any) {
        print(emailTextField.text ?? "hello")
        let vc = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as! ThirdViewController
        vc.login = emailTextField.text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        if checkFilledFeilds() {
            let vc = self.storyboard?.instantiateViewController(identifier: "FinalViewController") as! FinalViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    func checkFilledFeilds()->Bool{
        let name=isFilled(tf: emailTextField)
        let password = isFilled(tf: passwordTextField)
        if  name && password {
            return true
        } else {
            return false
        }
    }
}

