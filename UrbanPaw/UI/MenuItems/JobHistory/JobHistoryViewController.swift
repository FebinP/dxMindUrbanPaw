//
//  JobHistoryViewController.swift
//  UrbanPaw
//
//  Created by Mac User on 13/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit

extension UISegmentedControl {

func removeBorder(){
    
    self.tintColor = UIColor.clear
    self.backgroundColor = UIColor.clear
    self.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor :UIColor(red: 229/255.0, green: 66/255.0, blue: 153/255.0, alpha: 1)], for: .selected)
    self.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
    
}
}

class JobHistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var mProductview: UIView!
    @IBOutlet weak var mServiceView: UIView!
    
    @IBOutlet weak var mClinicalView: UIView!
    @IBOutlet weak var viewdetailslbl: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var mJobHistoryTableView: UITableView!
    
    var selectedCateroy = 1
    let segmentBottomBorder = CALayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControl.removeBorder()
              setBorder(sender: segmentControl)
        
    mJobHistoryTableView.register(UINib(nibName: "JobHistoryTableViewCell", bundle: .main), forCellReuseIdentifier: "JobHistoryTableViewCell")
        
        self.title = "Job History"
        //title.tintColor = UIColor.systemPink
//        let button1 = UIBarButtonItem(image: UIImage(named: "notification"), style: .plain, target: self, action: Selector("action")) // action:#selector(Class.MethodName) for swift 3
        let button1 = UIBarButtonItem(image: UIImage(named: "notification"), style: .plain, target: self, action: #selector(toggleTapped)) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.rightBarButtonItem  = button1
        button1.tintColor = UIColor.gray
        
        
        let button2 = UIBarButtonItem(image: UIImage(named: "HamburgerMenu"), style: .plain, target: self, action: #selector(toggleTapped)) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.leftBarButtonItem  = button2
        button2.tintColor = UIColor.gray
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: Constant.THEAMCOLOR]
                  
                   segmentControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
                   segmentControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        // Do any additional setup after loading the view.
    }
    //btn action
    @objc func notificationTapped()
    {
        
    }
    @objc func toggleTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func viewdetailslbtn(_ sender: UIButton!) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myVC = storyboard.instantiateViewController(withIdentifier: "jobhistorydetailsvc") as? jobhistorydetailsvc
        self.navigationController?.pushViewController(myVC!, animated: false)
    }
    @objc func buttonAction(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func notificationAction(_ sender: Any) {
    }
    @IBAction func segmentaction(_ sender: Any) {
        selectedCateroy = segmentControl.selectedSegmentIndex+1
        setBorder(sender:segmentControl)
        }
    func setBorder(sender:UISegmentedControl){
        
        let underlineWidth: CGFloat = sender.bounds.size.width / CGFloat(sender.numberOfSegments)
        let underlineHeight: CGFloat = 2
        let underlineXPosition = CGFloat(sender.selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = sender.bounds.size.height - underlineHeight
       segmentBottomBorder.frame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        //let underline = UIView(frame: underlineFrame)
        segmentBottomBorder.backgroundColor = Constant.THEAMCOLOR.cgColor
        sender.layer.addSublayer(segmentBottomBorder)
        
    }
//    @objc func toggleTapped(){
//
//    if(!isMenuShown){
//        menuTableView.isHidden = false
//        menuTableWtCnst.constant = 300
//        isMenuShown = true
//    }
//    else{
//        menuTableView.isHidden = true
//
//        menuTableWtCnst.constant = 0
//        isMenuShown = false
//
//    }
        
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: JobHistoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "JobHistoryTableViewCell", for: indexPath) as! JobHistoryTableViewCell
        
        cell.viewdetailslbl.tag = indexPath.row
        cell.viewdetailslbl.addTarget(self, action:#selector(viewdetailslbtn(_:)), for: UIControl.Event.touchUpInside)
          
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
