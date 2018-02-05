//
//  ViewController.swift
//  Switch
//
//  Created by rvd on 2/1/18.
//  Copyright © 2018 rvd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let mySwitch = UISwitch()
    let mySwitch2 = UISwitch()
    let myButton = UIButton()
    let myLabel = UILabel()
    let myLabel2 = UILabel()
    let mypicker = UIPickerView()
    let myPickerDate = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // create Label
        self.myLabel.frame = CGRect(x: 5, y: 20, width: 140, height: 25)
        self.myLabel.text = "Button is Off"
        self.view.addSubview(self.myLabel)
        
        self.myLabel2.frame = CGRect(x: 5, y: 60, width: 140, height: 25)
        self.myLabel2.text = "Button is off"
        self.view.addSubview(self.myLabel2)
        
        // create Button
        self.myButton.frame = CGRect(x: 210, y: 20, width: 90, height: 25)
        self.myButton.backgroundColor = UIColor.darkGray
        self.myButton.setTitle("OK", for: .normal)
        self.myButton.setTitle("On click", for: .highlighted)
        self.view.addSubview(self.myButton)
        
       
        // create switch
     self.mySwitch.frame = CGRect(x: 150, y: 20, width: 0, height: 0)
        self.view.addSubview(self.mySwitch)
        // switch is status - On
        
        
        if self.mySwitch.isOn {
            print("switch ON")
            self.mySwitch.thumbTintColor = UIColor.white
          //  self.myButton.isHidden = false -- no work
        } else {
            print("Switch OFF")
          //  self.myButton.isHidden = false
            
        }
        
        // create switch2 - metod two -- it's test metod -- OK!
    //    self.mySwitch2.frame = CGRect.zero
    //    self.mySwitch2.center = self.view.center
        
        
        // create switch2 metod one
        self.mySwitch2.frame = CGRect(x: 150, y: 60, width: 0, height: 0)
        
        self.view.addSubview(self.mySwitch2)
        
        // off
        self.mySwitch2.tintColor = UIColor.green
        // rychazok color
        self.mySwitch2.thumbTintColor = UIColor.red
        // on
        self.mySwitch2.onTintColor = UIColor.blue
        
        // create picker
      //  mypicker.center = view.center -- it's
        mypicker.frame  = CGRect(x: 5, y: 100, width: 150, height: 80)
        // subscribe of protocol
        mypicker.dataSource = self
        mypicker.delegate =  self
        self.view.addSubview(mypicker)
        
        // create Date picker
        myPickerDate.frame = CGRect(x: 5, y: 180, width: 300  , height: 200)
        myPickerDate.datePickerMode = .date
        self.view.addSubview(myPickerDate)
        
        // start initials block
        
           // --> user restriction! Change only two year from the current date
        var oneYearTime = TimeInterval()
            oneYearTime = 365 * 24 * 60 * 60
        let todayDate = Date()
        let oneYearFromToday = todayDate.addingTimeInterval(1)
        let twoYearFromDate  = todayDate.addingTimeInterval(2 * oneYearTime)
        
        myPickerDate.minimumDate = oneYearFromToday
        myPickerDate.maximumDate = twoYearFromDate
           // end restriction <--
        
        
        self.mySwitch.setOn(false, animated: true)
        self.myButton.isHidden = true
        self.mySwitch2.setOn(false, animated: true)
        
        self.myButton.isUserInteractionEnabled = false
        // end initials block
        
        
        // create observers of events --
        // switch start ->
        self.mySwitch.addTarget(self, action: #selector(switchChange(paramTarget:)), for: .valueChanged)
        
        self.mySwitch.addTarget(self, action: #selector(IsEnabled(target:)), for: .valueChanged)
        // end switch <-
        
        // button
        self.mySwitch2.addTarget(self, action: #selector(IsOn(target:)), for: .valueChanged)
        
        // date picker
        myPickerDate.addTarget(self, action: #selector(datePickerChange(paramDatePicker:)), for: .valueChanged)
        
        
        
    }
    
    @objc func datePickerChange(paramDatePicker: UIDatePicker ) {
        if paramDatePicker.isEqual(self.myPickerDate) {
            print("dateChange: =",paramDatePicker.date)
        }
        
    }
    
    
    @objc func IsEnabled(target: UISwitch) {
        if target.isOn {
          //  self.myButton.isUserInteractionEnabled = false
            self.myButton.isHidden = false
            self.myLabel.text = "Button is ON"
            
        } else {
           // self.myButton.isUserInteractionEnabled = true
            self.myButton.isHidden = true
            self.myLabel.text = "Button is OFF"
        }
    }
    
    
    @objc func IsOn(target: UISwitch) {
        if target.isOn {
            self.myButton.isUserInteractionEnabled = true
            self.myLabel2.text = "Button is Unblocked"
           // self.myButton.isHidden = true
        } else {
            self.myButton.isUserInteractionEnabled = false
            self.myLabel2.text = "Button is blocked"
         //   self.myButton.isHidden = false
            
        }
    }
    
    @objc func switchChange(paramTarget: UISwitch) {
        print("param is =", paramTarget)
        if paramTarget.isOn {
            print("sw is ON")
        } else {
            print("sw is OFF")
            
        }
    }
 

}

extension ViewController: UIPickerViewDataSource {
    // the number of components will be output
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // number of lines in a component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "row = \(row)"
        return result
    }
}
