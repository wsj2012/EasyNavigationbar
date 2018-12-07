//
//  SecondViewController.swift
//  YZTNavigationBarDemo
//
//  Created by 王树军(金融壹账通客户端研发团队) on 2018/11/20.
//  Copyright © 2018 王树军(金融壹账通客户端研发团队). All rights reserved.
//

import UIKit

class SecondViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navBar.title = "Custom"
        navBar.titleLabelColor = UIColor.white
        navBar.easy_setRightButton(title: "设置", titleColor: UIColor.white)
        navBar.onRightButtonDidClick = {
            let personalController = YZTPersonalCenterViewController()
            self.navigationController?.pushViewController(personalController, animated: true)
        }
    }
    
}

