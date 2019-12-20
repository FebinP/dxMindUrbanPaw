//
//  LoginVC.swift
//  UrbanPaw
//
//  Created by Mac User on 13/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit
import Toast_Swift
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func addBorder() {
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
    
}
class LoginVC: UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        emailTF.setLeftPaddingPoints(10)
        emailTF.addBorder()
        passwordTF.setLeftPaddingPoints(10)
        passwordTF.addBorder()
        // Do any additional setup after loading the view.
    }
    @IBAction func loginBtnClk(_ sender: Any) {
        
        if(emailTF.text == "")
        {
            self.view.makeToast("Please Enter Email Id or Mobile number")
            return
        }
        
        
        if(passwordTF.text == "")
        {
            self.view.makeToast("Please Enter Password")
            return
        }
        
        
        
        
        emailTF .resignFirstResponder()
        passwordTF.resignFirstResponder()
        
        performSegue(withIdentifier: "loginToOrderSegue", sender: nil)
    }
    func isEmail(emailString: String) -> Bool {
        // Sample regex for email - You can use your own regex for email
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailString)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
