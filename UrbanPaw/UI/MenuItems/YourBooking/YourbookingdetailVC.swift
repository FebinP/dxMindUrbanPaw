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
       @IBOutlet weak var mfileBtn : UIButton!
        
       
       var selectedCateroy = 1
       let segmentBottomBorder = CALayer()
       
       override func viewDidLoad() {
           super.viewDidLoad()
        let myimage = UIImage(named: "files")
        let tintedImage = myimage?.withRenderingMode(.alwaysTemplate)
        mfileBtn.setImage(tintedImage, for: .normal)
        mfileBtn.tintColor = UIColor(red: 5/255.0, green: 61/255.0, blue: 83/255.0, alpha: 1.0)
        
     
            

       }
       @objc func notificationTapped()
       {
           
       }
    
    @IBAction func mAcceptBtnaction(_ sender: Any) {
    
        
    
        }
    
    @IBAction func mRejectBtnaction(_ sender: Any) {
    }
    @IBAction func mCallNowBtnaction(_ sender: Any) {
        
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
    
   //    @objc func toggleTapped(){
   //        self.navigationController?.popViewController(animated: true)
   //    }
//       @IBAction func mDetailsSegmentaction(_ sender: Any) {
//           //segmentBottomBorder.removeFromSuperlayer()
//               setBorder(sender: mDetailsSegment)
//               selectedCateroy = mDetailsSegment.selectedSegmentIndex+1
//
//           }
           
//           func setBorder(sender:UISegmentedControl){
//
//               let underlineWidth: CGFloat = sender.bounds.size.width / CGFloat(sender.numberOfSegments)
//               let underlineHeight: CGFloat = 2
//               let underlineXPosition = CGFloat(sender.selectedSegmentIndex * Int(underlineWidth))
//               let underLineYPosition = sender.bounds.size.height - underlineHeight
//               segmentBottomBorder.frame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
//               //let underline = UIView(frame: underlineFrame)
//               segmentBottomBorder.backgroundColor = UIColor(red: 5/255.0, green: 61/255.0, blue: 83/255.0, alpha: 1.0).cgColor
//               sender.layer.addSublayer(segmentBottomBorder)
//
//           }

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


