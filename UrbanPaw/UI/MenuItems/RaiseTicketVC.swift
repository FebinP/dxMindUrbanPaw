//
//  RaiseTicketVC.swift
//  UrbanPaw
//
//  Created by Mac User on 16/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit

class RaiseTicketVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate{
    @IBOutlet weak var messageTV: UITextView!
    @IBOutlet weak var priorityTF: UITextField!
    @IBOutlet weak var serviceTypeTF: UITextField!
    
    let thePicker = UIPickerView()
    let servicetypeArray = ["Service 1","Service 2","Service 3"]
    let priorityArray = ["prority 1","prority 2","priority 3","priority 4"]
    var selectedTF = 0
    var placeholderLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTV.layer.borderColor = UIColor.lightGray.cgColor
        messageTV.layer.borderWidth = 1.0
        
        thePicker.delegate = self
        thePicker.dataSource = self

        serviceTypeTF.inputView = thePicker
        priorityTF.inputView = thePicker
        
               messageTV.delegate = self
               placeholderLabel = UILabel()
               placeholderLabel.text = "Message"
               //placeholderLabel.font = UIFont.regularSystemfont(ofSize: (messageTV.font?.pointSize)!)
               placeholderLabel.sizeToFit()
               messageTV.addSubview(placeholderLabel)
               placeholderLabel.frame.origin = CGPoint(x: 5, y: (messageTV.font?.pointSize)! / 2)
               placeholderLabel.textColor = UIColor.lightGray
               placeholderLabel.isHidden = !messageTV.text.isEmpty
        
        self.navigationItem.setHidesBackButton(true, animated:true);
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "HamburgerMenu"), style: .plain, target: self, action: #selector(toggleTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.lightGray
        self.title = "Raise Ticket"

        // Do any additional setup after loading the view.
    }
    
     @objc func toggleTapped(){
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
     // MARK: - Text View Delegate
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    
    
    // MARK: - Picker View
    
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if selectedTF == 0{
        return servicetypeArray.count
        }
        else{
        return priorityArray.count
        }
        
       }
    
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      
        if selectedTF == 0{
        return servicetypeArray[row]
        }
        else{
        return priorityArray[row]
        }
           
           
       }
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if selectedTF == 0{
            serviceTypeTF.text = servicetypeArray[row]
        }
        else{
            priorityTF.text = priorityArray[row]
        }
           
       }
       
    @IBAction func textfieldEditingBegain(_ sender: UITextField) {
        if sender.tag == 0{
            if serviceTypeTF.text == ""{
                serviceTypeTF.text = servicetypeArray[0]
            }
        }
        else{
            
            if priorityTF.text == ""{
                 priorityTF.text = priorityArray[0]
            }
        }
        selectedTF = sender.tag

        thePicker.selectRow(0, inComponent: 0, animated: false)
        thePicker.reloadAllComponents()
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
