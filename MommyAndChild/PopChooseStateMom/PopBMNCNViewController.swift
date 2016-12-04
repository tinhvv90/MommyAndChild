//
//  PopBMNCNViewController.swift
//  MommyAndChild
//
//  Created by Đỗ Việt on 12/2/16.
//  Copyright © 2016 Vu Tinh. All rights reserved.
//

import UIKit

let toggleBMNCN = "NotificationBMNCN"

class PopBMNCNViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerViewMonthYear: UIPickerView!
    
    var pickDataSource = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerViewMonthYear.delegate = self
        pickerViewMonthYear.dataSource = self
        
        for var i in 12...24 {
            pickDataSource.append(i)
            i += 1
        }

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func XongBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        // get value raw choose of pickerView
        let selectedPickerView = pickerViewMonthYear.selectedRow(inComponent: 0)
        
        NotificationCenter.default.post(name: NSNotification.Name.init(toggleBMNCN), object: pickDataSource[selectedPickerView])
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickDataSource[row])
    }
    
    //change style of pickerView
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.red
        pickerLabel.text = String(pickDataSource[row])
        pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 28)
        //pickerLabel.font = UIFont(name: "Arial-BoldMT", size: 15) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }

}
