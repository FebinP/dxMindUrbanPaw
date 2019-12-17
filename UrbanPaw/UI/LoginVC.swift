//
//  LoginVC.swift
//  UrbanPaw
//
//  Created by Mac User on 13/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit
import Toast_Swift

class LoginVC: UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

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
