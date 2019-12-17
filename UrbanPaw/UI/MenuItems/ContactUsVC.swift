//
//  ContactUsVC.swift
//  UrbanPaw
//
//  Created by Mac User on 16/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit
import MessageUI

class ContactUsVC: UIViewController,UITableViewDataSource,UITableViewDelegate,MFMailComposeViewControllerDelegate {

    @IBOutlet weak var contactDetailTable: UITableView!
    
    let sectionTitleArray = ["Email Us","Contact Us"]
    let detailArray = ["support@urbanpaws.com","Call Us : +99009 90099"]
    override func viewDidLoad() {
        super.viewDidLoad()
 
        contactDetailTable.delegate = self
        contactDetailTable.dataSource = self
        contactDetailTable.isScrollEnabled = false
        
        
        self.navigationItem.setHidesBackButton(true, animated:true);
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "HamburgerMenu"), style: .plain, target: self, action: #selector(toggleTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.lightGray

        self.title = "Contact US"
        // Do any additional setup after loading the view.
    }
    
    @objc func toggleTapped(){
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
       {
           return 2
       }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        
        let headerView = UIView(frame:CGRect (x: 0, y: 0, width:tableView.frame.size.width , height:45))
        headerView.backgroundColor = UIColor.lightGray
       // headerView.backgroundColor = UIColor.clear
       // headerView.layer.cornerRadius = 5
        let bgLabel = UILabel(frame : CGRect (x: 3, y: 0, width:tableView.frame.size.width - 6, height:45))
        bgLabel.backgroundColor = UIColor.clear
        bgLabel.backgroundColor = UIColor.clear
        bgLabel.text = sectionTitleArray[section]

        headerView.addSubview(bgLabel)
      
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 1
         
    }
          
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.selectionStyle = .none
        if indexPath.section == 0{
            cell.textLabel?.attributedText = NSAttributedString(string: detailArray[0], attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        }
        else{
            cell.textLabel?.attributedText = NSAttributedString(string: detailArray[1], attributes:
                       [.underlineStyle: NSUnderlineStyle.single.rawValue])
        }
       // cell.textLabel?.text = characters[indexPath.row]
                  
        return cell
           
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            let mailComposeViewController = configureMailComposer()
            if MFMailComposeViewController.canSendMail(){
                self.present(mailComposeViewController, animated: true, completion: nil)
            }else{
                print("Can't send email")
            }
            
        }
        if indexPath.section == 1{
            if let phoneCallURL = URL(string: "tel://\( Constant.CONTACTNUMBER)") {
                
                let application:UIApplication = UIApplication.shared
                if (application.canOpenURL(phoneCallURL)) {
                    if #available(iOS 10.0, *) {
                        application.open(phoneCallURL, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(phoneCallURL)
                    }
                }
                else{
                    let alertController = UIAlertController(title: "Error", message:
                        "Not able to make a call.", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)            }
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 44
       }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45.0
    }

    
    func configureMailComposer() -> MFMailComposeViewController{
           let mailComposeVC = MFMailComposeViewController()
           mailComposeVC.mailComposeDelegate = self
           mailComposeVC.setToRecipients([detailArray[0]])
           return mailComposeVC
       }
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        // Check the result or perform other tasks.
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
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
