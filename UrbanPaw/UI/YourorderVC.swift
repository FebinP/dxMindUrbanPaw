//
//  YourorderVC.swift
//  UrbanPaw
//
//  Created by Mac User on 13/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit

class YourorderVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   

    
    @IBOutlet weak var menuTableWtCnst: NSLayoutConstraint!
    @IBOutlet weak var menuTableView: UITableView!
    
    var isMenuShown = false
    let menuArray = ["Profile","Job History","Your Bookings","Product orders","Account Settings","Conotact Admin","Raise Ticket","Chat Support","Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated:true);
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(toggleTapped))
        menuTableWtCnst.constant = 0
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.isHidden = true
        menuTableView.layer.shadowPath = UIBezierPath(rect: menuTableView.bounds).cgPath
        menuTableView.layer.shadowColor = UIColor.black.cgColor
        menuTableView.layer.shadowOpacity = 1
        menuTableView.layer.shadowOffset = CGSize.zero
        menuTableView.layer.shadowRadius = 10
        menuTableView.clipsToBounds = false;
        
        // Do any additional setup after loading the view.
    }
    
    @objc func toggleTapped(){
        
        if(!isMenuShown){
            menuTableView.isHidden = false
            menuTableWtCnst.constant = 300
            isMenuShown = true
        }
        else{
            menuTableView.isHidden = true

            menuTableWtCnst.constant = 0
            isMenuShown = false

        }
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations:{

            self.view.layoutIfNeeded()
            
        })
        
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as!MenuTableCell
        cell.menuTitle.text = menuArray[indexPath.row]  
            return cell
        
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
