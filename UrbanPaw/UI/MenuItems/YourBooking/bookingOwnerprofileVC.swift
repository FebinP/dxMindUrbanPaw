//
//  bookingOwnerprofileVC.swift
//  UrbanPaw
//
//  Created by Mac User on 17/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit



class bookingOwnerprofileVC: UIViewController   {
    
    @IBOutlet weak var mOwnerMapView: MKMapView!
    @IBOutlet weak var mMAPView: UIView!
    @IBOutlet weak var mServicetypTxtfld: UITextField!
    @IBOutlet weak var mtxtView: UIView!
    @IBOutlet weak var mtxtAcceptesBtn: UIButton!
    @IBOutlet weak var mPreventionhealthtxtfld: UITextField!
    @IBOutlet weak var mMapBtn : UIButton!
    @IBOutlet weak var mServiorityTxtFld: UITextField!
    @IBOutlet weak var dentaltxtexamination: UITextField!
    
    @IBOutlet weak var mAmounttxt: UITextField!
    @IBOutlet weak var mDescriptiontxtview: UITextView!
    @IBOutlet weak var mUploadImagebtn: UIButton!
    
    @IBOutlet weak var mUploadImagetxt: UITextField!
    
    
    var imageUrl : String = "0"
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        textField.text = nil
//        textField.placeholder = "My Placeholder Text"
        
       
//        let myImage = UIImage(named: "add-photo") {
//        let tintableImage = myImage.withRenderingMode(.alwaysTemplate)
//            cell.mImageView.image = tintableImage
//            cell.mImageView.tintColor = UIColor.gray
        
        let myimage = UIImage(named: "add-photo")
        let tintedImage = myimage?.withRenderingMode(.alwaysTemplate)
        mUploadImagebtn.setImage(tintedImage, for: .normal)
        mUploadImagebtn.tintColor = UIColor(red: 5/255.0, green: 61/255.0, blue: 83/255.0, alpha: 1.0)
         
        
        self.mtxtView.isHidden = true
        
        let location = CLLocationCoordinate2D(latitude: 51.50007773,
                longitude: -0.1246402)
            
            // 2
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
                mOwnerMapView.setRegion(region, animated: true)
                
            //3
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "Big Ben"
            annotation.subtitle = "London"
            mOwnerMapView.addAnnotation(annotation)
        }
    
    override func viewWillAppear(_ animated: Bool) {
//        let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(triggerTouchAction))
//        mOwnerMapView.addGestureRecognizer(gestureRecognizer)
        
        let  tapGesture = UITapGestureRecognizer(target: self, action: #selector(triggerTouchAction(_:)))

         
       
        mOwnerMapView.addGestureRecognizer(tapGesture)
        
        
        
        
        
        
       }
    
    
    @IBAction func mUpoadimageBtn(_ sender: Any) {
        
        
    }
    @IBAction func mAcceptBtnaction(_ sender: Any) {
    
        self.mMAPView.isHidden = true
        self.mtxtView.isHidden = false
        mtxtAcceptesBtn.isEnabled = false
    
        }
    @IBAction func mmapBtnaction(_ sender: Any) {
        
        
       
    }
    
    @IBAction func mRejectBtnaction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myVC = storyboard.instantiateViewController(withIdentifier: "YourorderVC") as! YourorderVC
        self.navigationController?.pushViewController(myVC, animated: false)
        
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
    
    @IBAction func mtextAcceptBtnaction(_ sender: Any) {
    
        
    
        }
    
    @IBAction func mtxtclaimBtnaction(_ sender: Any) {
    }
    @IBAction func mtxtfinishBtnaction(_ sender: Any) {
    }
    
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
//    func openGallary()
//    {
//        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
//        imagePicker.allowsEditing = true
//        self.present(imagePicker, animated: true, completion: nil)
//    }
    //MARK:-- ImagePicker delegate
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            // imageViewPic.contentMode = .scaleToFill
//            self.mProfileImage.image = pickedImage
//            self.mProfileImage.contentMode = .scaleToFill
//            self.mProfileImage.layer.cornerRadius = self.mProfileImage.frame.size.width/2
//            self.mProfileImage.layer.masksToBounds = true
//        }
        //picker.dismiss(animated: true, completion: nil)
      //  count = 0
    
    
    @objc  func triggerTouchAction(_ gestureRecognizer:UITapGestureRecognizer) {
        
         if(UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://")! as URL)) {
            UIApplication.shared.open(NSURL(string:
                       "comgooglemaps://?center=40.765819,-73.975866&zoom=14&views=traffic")! as URL)
                }
        //        else {
        //          NSLog("Can't use Google Maps");
        //        }
                 
                //Apple Maps
               else if (UIApplication.shared.canOpenURL(NSURL(string:"http://maps.apple.com")! as URL)) {
                    UIApplication.shared.open(NSURL(string:
                    "http://maps.apple.com/?daddr=San+Francisco,+CA&saddr=cupertino")!as URL)
                }
                else {
                  print ( "install Maps");
                }
                
          
    }
        
    }
    



