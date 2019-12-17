//
//  ProfileVC.swift
//  UrbanPaw
//
//  Created by Mac User on 17/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var profileTitleLbl: UILabel!
    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var professionLbl: UILabel!
    
    @IBOutlet weak var profilePicImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var serviceDateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
   
    @IBOutlet weak var profileTableView: UITableView!
    
    @IBOutlet weak var tableViewHtCnst: NSLayoutConstraint!
    let sectionTitleArray = ["Profile Detail","Proffesional Expertise"]
    let profDetailArray = ["Name:","Emp ID:","E-mail Id:","Mobile No:","Alternate No:"]
    let expertiseArray = ["Experience","Expertise Area"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lineView.backgroundColor = Constant.THEAMCOLOR
        professionLbl.text = "Vetinary Doctor"
        addressLabel.text = "11th cross, Ns palaya,BTm 2nd stage,Bangalore,676543"
        serviceDateLabel.text = "Service Required On: 11/12/19"
        timeLabel.text = "Time : 2PM"
        
        profilePicImage.image = UIImage(named: "defaultImage")
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.isScrollEnabled = false
        
        self.navigationItem.setHidesBackButton(true, animated:true);
               navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "HamburgerMenu"), style: .plain, target: self, action: #selector(toggleTapped))
               navigationItem.leftBarButtonItem?.tintColor = UIColor.lightGray

               self.title = "Profile"
        // Do any additional setup after loading the view.
    }
    @objc func toggleTapped(){
          
          self.navigationController?.popViewController(animated: true)
      }
      
    override func viewWillLayoutSubviews() {
                super.updateViewConstraints()
                
            tableViewHtCnst?.constant = self.profileTableView.contentSize.height

            
            }
    
    
    // MARK: - table view
    func numberOfSections(in tableView: UITableView) -> Int
          {
            return sectionTitleArray.count
          }
       func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
       {
           
           let headerView = UIView(frame:CGRect (x: 0, y: 0, width:tableView.frame.size.width , height:45))
           headerView.backgroundColor = UIColor.white
          // headerView.backgroundColor = UIColor.clear
          // headerView.layer.cornerRadius = 5
           let bgLabel = UILabel(frame : CGRect (x: 3, y: 0, width:tableView.frame.size.width - 6, height:45))
           bgLabel.backgroundColor = UIColor.clear
           bgLabel.backgroundColor = UIColor.clear
           bgLabel.text = sectionTitleArray[section]
           bgLabel.font = UIFont.boldSystemFont(ofSize: 19.0)

           headerView.addSubview(bgLabel)
         
           return headerView
           
       }
    
  

       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return profDetailArray.count
        }
        else{
            return expertiseArray.count
        }
            
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as!ProfileTableCell
           cell.selectionStyle = .none
           if indexPath.section == 0{
            cell.profileTitle.text = profDetailArray[indexPath.row]
           }
           else{
               cell.profileTitle.text = expertiseArray[indexPath.row]
           }
          // cell.textLabel?.text = characters[indexPath.row]
                     
           return cell
              
          }
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
       }
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
              return 44
          }
      
       func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 45.0
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
