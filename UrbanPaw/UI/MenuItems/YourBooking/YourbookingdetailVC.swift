//
//  YourbookingdetailVC.swift
//  UrbanPaw
//
//  Created by Mac User on 17/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit


// ********************* pet detail view controller ****************************//
class YourbookingdetailVC: UIViewController {

   @IBOutlet weak var mDetailsSegment : UISegmentedControl!
       
       //@IBOutlet weak var mTreatmentNamelbl : UILabel!
       @IBOutlet weak var mUserAddresslbl : UILabel!
       @IBOutlet weak var mPetIDlbl : UILabel!
       @IBOutlet weak var mPetTypelbl : UILabel!
       @IBOutlet weak var mTreatmentNamelbl : UILabel!
        @IBOutlet weak var mBreedTypelbl : UILabel!
       
       @IBOutlet weak var mAgelbl : UILabel!
       @IBOutlet weak var mGenderlbl : UILabel!
       @IBOutlet weak var mWeightlbl : UILabel!
        @IBOutlet weak var mVaccinationdtllbl : UILabel!
       @IBOutlet weak var mMedicalhstylbl : UILabel!
       @IBOutlet weak var mCurrentMedicationlbl : UILabel!
       @IBOutlet weak var mBloodGrouplbl : UILabel!
        @IBOutlet weak var mBloodDonorlbl : UILabel!
       //@IBOutlet weak var mLastdatelbl : UILabel!
       @IBOutlet weak var mLastdatelbl : UILabel!
       @IBOutlet weak var mDontaedlbl : UILabel!
       @IBOutlet weak var mfoodpreferancelbl : UILabel!
       @IBOutlet weak var mGeneralBehaviourlbl : UILabel!
        @IBOutlet weak var msafeBreedinfglbl : UILabel!
       @IBOutlet weak var maboutpetlbl : UILabel!
       
       var selectedCateroy = 1
       let segmentBottomBorder = CALayer()
       
       override func viewDidLoad() {
           super.viewDidLoad()
            
           mDetailsSegment.removeBorder()
           setBorder(sender: mDetailsSegment)
           self.title = "Pet details"
           //title.tintColor = UIColor.systemPink
           let button1 = UIBarButtonItem(image: UIImage(named: "notification"), style: .plain, target: self, action: #selector(notificationTapped)) // action:#selector(Class.MethodName) for swift 3
           self.navigationItem.rightBarButtonItem  = button1
           button1.tintColor = UIColor(red: 5/255.0, green: 61/255.0, blue: 83/255.0, alpha: 1.0)
           
           
   //        let button2 = UIBarButtonItem(image: UIImage(named: "HamburgerMenu"), style: .plain, target: self, action: #selector(toggleTapped)) // action:#selector(Class.MethodName) for swift 3
   //        self.navigationItem.leftBarButtonItem  = button2
   //        button2.tintColor = UIColor.gray
           // Do any additional setup after loading the view.
       }
       @objc func notificationTapped()
       {
           
       }
   //    @objc func toggleTapped(){
   //        self.navigationController?.popViewController(animated: true)
   //    }
       @IBAction func mDetailsSegmentaction(_ sender: Any) {
           //segmentBottomBorder.removeFromSuperlayer()
               setBorder(sender: mDetailsSegment)
               selectedCateroy = mDetailsSegment.selectedSegmentIndex+1
                   
           }
           
           func setBorder(sender:UISegmentedControl){
               
               let underlineWidth: CGFloat = sender.bounds.size.width / CGFloat(sender.numberOfSegments)
               let underlineHeight: CGFloat = 2
               let underlineXPosition = CGFloat(sender.selectedSegmentIndex * Int(underlineWidth))
               let underLineYPosition = sender.bounds.size.height - underlineHeight
               segmentBottomBorder.frame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
               //let underline = UIView(frame: underlineFrame)
               segmentBottomBorder.backgroundColor = UIColor(red: 5/255.0, green: 61/255.0, blue: 83/255.0, alpha: 1.0).cgColor
               sender.layer.addSublayer(segmentBottomBorder)
               
           }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


