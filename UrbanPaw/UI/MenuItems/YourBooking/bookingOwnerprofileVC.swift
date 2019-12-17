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


class bookingOwnerprofileVC: UIViewController {
    
    @IBOutlet weak var mOwnerMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    
    
    @IBAction func mAcceptBtnaction(_ sender: Any) {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let myVC = storyboard.instantiateViewController(withIdentifier: "AcceptProfileVC") as? AcceptProfileVC
    self.navigationController?.pushViewController(myVC!, animated: false)
    
        }
    
    @IBAction func mRejectBtnaction(_ sender: Any) {
    }
    @IBAction func mCallNowBtnaction(_ sender: Any) {
    }
    

}

