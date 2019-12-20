//
//  ChangePasswordVC.swift
//  UrbanPaw
//
//  Created by Mac User on 19/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var cnfrmPasswordTF: UITextField!
    @IBOutlet weak var newPasswordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Password"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitBtnClk(_ sender: Any) {
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
