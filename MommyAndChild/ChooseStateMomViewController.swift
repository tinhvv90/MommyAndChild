//
//  ChooseStateMomViewController.swift
//  MommyAndChild
//
//  Created by Đỗ Việt on 12/2/16.
//  Copyright © 2016 Vu Tinh. All rights reserved.
//

import UIKit

class ChooseStateMomViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    
    @IBOutlet weak var labelOfBamemangthai: UILabel!
    @IBOutlet weak var labelOfBamemoisinh: UILabel!
    @IBOutlet weak var labelOfBamenuoiconnho: UILabel!
    
    @IBOutlet weak var buttonBamemangthai: UIButton!
    @IBOutlet weak var buttonBamemoisinh: UIButton!
    @IBOutlet weak var buttonBamenuoiconnho: UIButton!
    
    var isStateChoose :Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //checkStateLabel()
        
        checkStateButton()
       
        addNotification()
    }
    
    func addNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handlerRuturnValueBMMT), name: NSNotification.Name(toggleBMMT), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlerRuturnValueBMMS), name: NSNotification.Name(toggleBMMS), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlerRuturnValueBMNCN), name: NSNotification.Name(toggleBMNCN), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func handlerRuturnValueBMMT(notification: NSNotification){
        let value = notification.object
        labelOfBamemangthai.text = String(describing: value!) + " Tuần"
        labelOfBamemangthai.isEnabled = true
    }
    
    func handlerRuturnValueBMMS(notification: NSNotification){
        let value = notification.object
        labelOfBamemoisinh.text = String(describing: value!) + " Tháng"
        labelOfBamemoisinh.isEnabled = true
    }
    
    func handlerRuturnValueBMNCN(notification: NSNotification){
        let value = notification.object
        labelOfBamenuoiconnho.text = String(describing: value!) + " Tuổi"
        labelOfBamenuoiconnho.isEnabled = true
    }
    
    func checkStateLabel() {
//        labelOfBamemangthai.isHidden = true
//        labelOfBamemoisinh.isHidden = true
//        labelOfBamenuoiconnho.isHidden = true
        labelOfBamemangthai.isEnabled = false
        labelOfBamemangthai.text = ""
        
        labelOfBamemoisinh.isEnabled = false
        labelOfBamemoisinh.text = ""
        
        labelOfBamenuoiconnho.isEnabled = false
        labelOfBamenuoiconnho.text = ""
    }
    
    func checkStateButton() {
        buttonBamemangthai.isSelected = false
        buttonBamemoisinh.isSelected = false
        buttonBamenuoiconnho.isSelected = false
    }

    @IBAction func chooseStateBamemangthai(_ sender: Any) {
        
        checkStateLabel()
        checkStateButton()
        buttonBamemangthai.isSelected = true
        //labelOfBamemangthai.isHidden = false
        isStateChoose = true
        
    }
    
    @IBAction func chooseStateBamemoisinh(_ sender: Any) {
        checkStateButton()
        checkStateLabel()
        isStateChoose = true
        buttonBamemoisinh.isSelected = true
        //labelOfBamemoisinh.isHidden = false
    }
    
    @IBAction func chooseStateBamenuoiconnho(_ sender: Any) {
        checkStateButton()
        checkStateLabel()
        isStateChoose = true
        buttonBamenuoiconnho.isSelected = true
        //labelOfBamenuoiconnho.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBMMT" {
            let vc = segue.destination as! PopBMMTViewController
            vc.popoverPresentationController?.delegate = self
            vc.popoverPresentationController?.sourceView = self.view
            vc.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
            
        } else if segue.identifier == "showBMMS" {
            
            let vc = segue.destination as! PopBMMSViewController
            vc.popoverPresentationController?.delegate = self
            vc.popoverPresentationController?.sourceView = self.view
            vc.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        } else if segue.identifier == "showBMNCN" {
        
            let vc = segue.destination as! PopBMNCNViewController
            vc.popoverPresentationController?.delegate = self
            vc.popoverPresentationController?.sourceView = self.view
            vc.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        } else if segue.identifier == "showHomePage"{
        
            if isStateChoose == false {
                let alert = UIAlertController(title: "Thông báo", message: "Mời bạn chọn thông tin", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Hủy", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else if labelOfBamemangthai.isEnabled == false && labelOfBamemoisinh.isEnabled == false && labelOfBamenuoiconnho.isEnabled == false {
                let alert = UIAlertController(title: "Thông báo", message: "Mời bạn chọn thông tin chi tiết", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Hủy", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    
    
    
    

}
