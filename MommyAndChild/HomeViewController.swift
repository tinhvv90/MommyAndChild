//
//  ViewController.swift
//  MommyAndChild
//
//  Created by Vu Tinh on 12/2/16.
//  Copyright © 2016 Vu Tinh. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            print("show Music")
        case 2:
            print("show Themdo")
        case 3:
            print("3")
        case 4:
            print("show ThemLichKham")
        default:
            break
        }
    }
}


