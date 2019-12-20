//
//  AccountSettingVC.swift
//  UrbanPaw
//
//  Created by Mac User on 16/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit

class AccountSettingVC: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var settingsTable: UITableView!
    
    
    let settingsarray = ["Change password","Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Account Settings"

        settingsTable.delegate = self
        settingsTable.dataSource = self
        settingsTable.isScrollEnabled = false
        
        
        
        self.navigationItem.setHidesBackButton(true, animated:true);
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "HamburgerMenu"), style: .plain, target: self, action: #selector(toggleTapped))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        navigationItem.leftBarButtonItem?.tintColor = UIColor.lightGray
        // Do any additional setup after loading the view.
    }
    
    @objc func toggleTapped(){
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return settingsarray.count
          }
          
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as!SettingsTableCell
           cell.selectionStyle = .none
           cell.settingTitle.text = settingsarray[indexPath.row]

               return cell
           
       }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 44
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //ChangePasswordSegue
        
        if (indexPath.row == 0){
          performSegue(withIdentifier: "ChangePasswordSegue", sender: nil)
        }
        
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
