//
//  YourorderVC.swift
//  UrbanPaw
//
//  Created by Mac User on 13/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit
import DLRadioButton

class YourorderVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
   
    
   
    @IBOutlet weak var productCollectionViewHtCnst: NSLayoutConstraint!
    @IBOutlet weak var clinicalCollectionViewHtCnst: NSLayoutConstraint!
    
    @IBOutlet weak var serviceColectionViewHtCnst: NSLayoutConstraint!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var clinicalCollectionView: UICollectionView!
    @IBOutlet weak var serviceCollectionView: UICollectionView!
    @IBOutlet var radioBtn: [DLRadioButton]!
    @IBOutlet weak var sublayerViewWtCnst: NSLayoutConstraint!
    @IBOutlet weak var subLayerView: UIView!
    @IBOutlet weak var menuTableWtCnst: NSLayoutConstraint!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var findOrderTextfield: UITextField!
    @IBOutlet weak var yourPetServiceLbl: UILabel!
    @IBOutlet weak var clinicalServiceLabel: UILabel!
    @IBOutlet weak var productOrders: UILabel!
    
    var isMenuShown = false
    let menuArray = ["Profile","Job History","Your Bookings","Product orders","Account Settings","Contact Admin","Raise Ticket","Chat Support","Logout"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated:true);
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "HamburgerMenu"), style: .plain, target: self, action: #selector(toggleTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.gray
        navigationItem.rightBarButtonItem =  UIBarButtonItem(image: UIImage(named: "notification"), style: .plain, target: self, action: #selector(showNotification))
        self.navigationController?.navigationBar.tintColor = Constant.THEAMCOLOR
        navigationItem.rightBarButtonItem?.tintColor = UIColor.gray

        self.title = "YOUR ORDERS"

        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.isScrollEnabled = false
        menuTableView.backgroundColor = Constant.THEAMCOLOR
        
        serviceCollectionView.delegate = self
        serviceCollectionView.dataSource = self
        
        clinicalCollectionView.dataSource = self
        clinicalCollectionView.delegate = self
        
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        
        
        setUplayout()

      
    }
    
    override func viewWillAppear(_ animated: Bool) {
          
    }
    
    override func viewWillLayoutSubviews() {
           super.updateViewConstraints()
           
           serviceColectionViewHtCnst?.constant = self.serviceCollectionView.contentSize.height
           productCollectionViewHtCnst?.constant = self.productCollectionView.contentSize.height
           clinicalCollectionViewHtCnst?.constant = self.clinicalCollectionView.contentSize.height

       
       }
    fileprivate func setUplayout() {
        for  radiobtn in radioBtn{
        if radiobtn.tag == 1{
            radiobtn.isSelected = true
        }
        else{
            radiobtn.isSelected = false

            }
           
        }
           menuTableWtCnst.constant = 0
           sublayerViewWtCnst.constant = 0
           subLayerView.layer.shadowOpacity = 0.18
           subLayerView.layer.shadowOffset = CGSize(width: 0, height: 2)
           subLayerView.layer.shadowRadius = 2
           subLayerView.layer.shadowColor = UIColor.black.cgColor
           subLayerView.layer.masksToBounds = false        // Do any additional setup after loading the view.
           findOrderTextfield.layer.borderColor = Constant.THEAMCOLOR.cgColor
           findOrderTextfield.layer.borderWidth = 1.0
           setBorderStyleLabel(label: yourPetServiceLbl)
           setBorderStyleLabel(label: clinicalServiceLabel)
           setBorderStyleLabel(label: productOrders)
       }
       
    @objc func toggleTapped(){
        
        if(!isMenuShown){
            menuTableWtCnst.constant = 300
            sublayerViewWtCnst.constant = 300
            isMenuShown = true
        }
        else{
            sublayerViewWtCnst.constant = 0
            menuTableWtCnst.constant = 0
            isMenuShown = false

        }
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations:{

            self.view.layoutIfNeeded()
            
        })
        
    }
    
    @IBAction func radioBtnClk(_ sender: DLRadioButton) {
        for  radiobtn in radioBtn{
            if radiobtn.tag == sender.tag{
                              radiobtn.isSelected = true
                          }
                          else{
                              radiobtn.isSelected = false

                              }
                             
                          }
    }
  
    @objc func showNotification(){
        
    }
    
    func setBorderStyleLabel(label:UILabel){
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.black.cgColor
    }
    
    // MARK: - Table View function

    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as!MenuTableCell
        cell.selectionStyle = .none
        cell.menuTitle.text = menuArray[indexPath.row]
        cell.backgroundColor = UIColor.clear

            return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            performSegue(withIdentifier: "ProfileSegue", sender: nil)
        }
        
        if (indexPath.row == 1)
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myVC = storyboard.instantiateViewController(withIdentifier: "JobHistoryViewController") as! JobHistoryViewController
            self.navigationController?.pushViewController(myVC, animated: false)
        }
        
        if indexPath.row == 2{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                   let myVC = storyboard.instantiateViewController(withIdentifier: "YourBookingVC") as! YourBookingVC
                   self.navigationController?.pushViewController(myVC, animated: false)
        }
        
        
        if indexPath.row == 4{
            performSegue(withIdentifier: "AccountSettingSegue", sender: nil)
        }
        if indexPath.row == 5{
            
            performSegue(withIdentifier: "ContactUSSegue", sender: nil)

        }
        if indexPath.row == 6{
            
            performSegue(withIdentifier: "raiseTicketSegue", sender: nil)

            
        }
    }
    // MARK: - Collection View function
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == serviceCollectionView{
            return 10
        }
        else if collectionView == clinicalCollectionView{
            return 6
        }
        else{
           return 3
        }
       
    }
       func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize
            // your code here
        {
            let width = serviceCollectionView.bounds.width/3
       
            return CGSize(width: width, height: 100)

        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets.zero
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! orderViewCollectionCell
        
        cell.orderImage.image = UIImage(named: "defaultImage")
        cell.orderTitle.text = "Boarding & kennel"
        cell.orderNumber.layer.cornerRadius = 10.0
        cell.orderNumber.text = "10"
        cell.orderNumber.layer.masksToBounds = true

        
            return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myVC = storyboard.instantiateViewController(withIdentifier: "YourBookingVC") as! YourBookingVC
        self.navigationController?.pushViewController(myVC, animated: false)
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
