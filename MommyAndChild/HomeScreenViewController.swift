//
//  HomeScreenViewController.swift
//  MommyAndChild
//
//  Created by Mạnh Thường Quân on 12/2/16.
//  Copyright © 2016 Vu Tinh. All rights reserved.
//

import UIKit

enum MotherHomeItemType: Int {
    case tintuc = 0, ghichu, thongbaomenu, tuvanhoidap, phongkham, dieuchinh
}

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Properties
    
    let cellContains   = [(imageName:"TinTuc", cellTitle:"Tin Tức"),
                          (imageName:"GhiChu", cellTitle:"Ghi chú"),
                          (imageName:"ThongBaoMenu", cellTitle:"Thông báo"),
                          (imageName:"TuVanHoiDap", cellTitle:"Tư vấn hỏi đáp"),
                          (imageName:"PhongKham", cellTitle:"Phòng khám"),
                          (imageName:"DieuChinh", cellTitle:"Điều chỉnh"),
                          ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}

extension HomeScreenViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        // Configure Cell
        if indexPath.section == 0 {
            cell.imgView.image = UIImage(named: cellContains[indexPath.item].imageName)
            cell.title.text = cellContains[indexPath.item].cellTitle
        } else if indexPath.section == 1 {
            cell.imgView.image = UIImage(named: cellContains[indexPath.item + 3].imageName)
            cell.title.text = cellContains[indexPath.item + 3].cellTitle
        }
        
        return cell
    }
}

extension HomeScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            switch indexPath.row {
            case MotherHomeItemType.tintuc.rawValue:
                print("show TinTuc")
//                performSegue(withIdentifier: "showTinTucVC", sender: self)
            case MotherHomeItemType.ghichu.rawValue:
                print("show GhiChu")
//                performSegue(withIdentifier: "showGhiChuVC", sender: self)
            case MotherHomeItemType.thongbaomenu.rawValue:
                print("show ThongBao")
//                performSegue(withIdentifier: "showThongBaoVC", sender: self)
            default:
                break
            }
        } else if indexPath.section == 1 {
            switch indexPath.row + 3 {
            case MotherHomeItemType.tuvanhoidap.rawValue:
                print("show TuVanHoiDap")
//                performSegue(withIdentifier: "showTuVanHoiDap", sender: self)
            case MotherHomeItemType.phongkham.rawValue:
                print("show PhongKhan")
//                performSegue(withIdentifier: "showPhongKham", sender: self)
            case MotherHomeItemType.dieuchinh.rawValue:
                print("show DieuChinh")
//                performSegue(withIdentifier: "showAdjust", sender: self)
            default:
                break
            }
        }
    }
}

