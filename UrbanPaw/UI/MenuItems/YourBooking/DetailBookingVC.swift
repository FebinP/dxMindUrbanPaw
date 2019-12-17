//
//  DetailBookingVC.swift
//  UrbanPaw
//
//  Created by Mac User on 17/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit

class DetailBookingVC: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var menuSegment: UISegmentedControl!
    
    private lazy var petdetailVC: YourbookingdetailVC = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "YourbookingdetailVC") as! YourbookingdetailVC
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var ownerDetailVC: bookingOwnerprofileVC = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "bookingOwnerprofileVC") as! bookingOwnerprofileVC
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuSegment.selectedSegmentIndex = 0
        updateView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func menuSegmentSelected(_ sender: UISegmentedControl) {
        
        updateView()    
        
    }
      private func updateView() {
            if menuSegment.selectedSegmentIndex == 0 {
                self.title = "User Detail"
                remove(asChildViewController: petdetailVC)
                self.navigationItem.leftBarButtonItem = nil

                add(asChildViewController: ownerDetailVC)
            } else if menuSegment.selectedSegmentIndex == 1 {
                self.title = "Pet Detail"

                remove(asChildViewController: ownerDetailVC)
                self.navigationItem.leftBarButtonItem = nil

                add(asChildViewController: petdetailVC)
            }
            
            
        }
   private func add(asChildViewController viewController: UIViewController) {
          // Add Child View Controller
          addChild(viewController)
          
          // Add Child View as Subview
        /*  view.addSubview(viewController.view)
          
          // Configure Child View
          viewController.view.frame = view.bounds
          viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
          
          // Notify Child View Controller
          viewController.didMove(toParent: self)*/
          
         viewController.view.frame =  CGRect(x:0, y:0, width:self.containerView.frame.size.width, height:self.containerView.frame.size.height)
          
         // viewController.view.frame = CGRectMake(0, 0, self.containerView.frame.size.width, self.containerView.frame.size.height);
          self.containerView.addSubview(viewController.view)
          viewController.didMove(toParent: self)
      }
      private func remove(asChildViewController viewController: UIViewController) {
          // Notify Child View Controller
          viewController.willMove(toParent: nil)
          
          // Remove Child View From Superview
          viewController.view.removeFromSuperview()
          
          // Notify Child View Controller
          viewController.removeFromParent()
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
