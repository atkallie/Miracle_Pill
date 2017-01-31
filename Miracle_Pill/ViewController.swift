//
//  ViewController.swift
//  Miracle_Pill
//
//  Created by Ahmed T Khalil on 1/31/17.
//  Copyright © 2017 kalikans. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //PICKER VIEW
    //states text field
    @IBOutlet var statesTextField: UITextField!
    let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        
        //link the text field to the picker view
        statesTextField.inputView = picker
        
        //for the popup view
        let xPos = UIScreen.main.bounds.size.width/2 - 300
        let yPos = UIScreen.main.bounds.size.height/2
        successView.center = CGPoint(x: xPos, y: yPos)
        
        closeButtonOutlet.alpha = 0.0
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    //set the number of rows
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return states.count
    }
    
    //set the title for each row
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return states[row]
    }
    
    //if a certain row is selected, set the text field's text to the selected state
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        statesTextField.text = states[row]
        self.view.endEditing(true)
    }
    
    
    //end editing whenever you touch anywhere outside the picker
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self refers to the View Controller
        //view refers to the view that the View Controller is managing
        self.view.endEditing(true)
    }
    
    @IBOutlet var successView: UIView!
    @IBOutlet var closeButtonOutlet: UIButton!
    
    //Pop Up
    @IBAction func buyNowBtn(_ sender: Any) {
        /*
        UIView.animate(withDuration: 0.3) {
            let xCenter = UIScreen.main.bounds.size.width/2
            let yCenter = UIScreen.main.bounds.size.height/2
            
            self.successView.center = CGPoint(x: xCenter, y: yCenter)
            self.closeButtonOutlet.alpha = 0.5
        }
         */
        
        //animation with bounce (slightly fancier than above)
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            
            let xCenter = UIScreen.main.bounds.size.width/2
            let yCenter = UIScreen.main.bounds.size.height/2
            
            self.successView.center = CGPoint(x: xCenter, y: yCenter)
            self.closeButtonOutlet.alpha = 0.5
            
        }, completion: nil)
    }
    
    @IBAction func closeButton(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            let yCenter = UIScreen.main.bounds.size.height/2
            
            self.successView.center = CGPoint(x: -300, y: yCenter)
            self.closeButtonOutlet.alpha = 0.0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //states array
    let states = ["",
                  "Alaska",
                  "Alabama",
                  "Arkansas",
                  "American Samoa",
                  "Arizona",
                  "California",
                  "Colorado",
                  "Connecticut",
                  "District of Columbia",
                  "Delaware",
                  "Florida",
                  "Georgia",
                  "Guam",
                  "Hawaii",
                  "Iowa",
                  "Idaho",
                  "Illinois",
                  "Indiana",
                  "Kansas",
                  "Kentucky",
                  "Louisiana",
                  "Massachusetts",
                  "Maryland",
                  "Maine",
                  "Michigan",
                  "Minnesota",
                  "Missouri",
                  "Mississippi",
                  "Montana",
                  "North Carolina",
                  " North Dakota",
                  "Nebraska",
                  "New Hampshire",
                  "New Jersey",
                  "New Mexico",
                  "Nevada",
                  "New York",
                  "Ohio",
                  "Oklahoma",
                  "Oregon",
                  "Pennsylvania",
                  "Puerto Rico",
                  "Rhode Island",
                  "South Carolina",
                  "South Dakota",
                  "Tennessee",
                  "Texas",
                  "Utah",
                  "Virginia",
                  "Virgin Islands",
                  "Vermont",
                  "Washington",
                  "Wisconsin",
                  "West Virginia",
                  "Wyoming"]
}

