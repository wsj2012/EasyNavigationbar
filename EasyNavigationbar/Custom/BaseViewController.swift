//
//  BaseViewController.swift
//  YZTNavigationBarDemo
//
//  Created by 王树军(金融壹账通客户端研发团队) on 2018/11/20.
//  Copyright © 2018 王树军(金融壹账通客户端研发团队). All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    lazy var navBar = EasyCustomNavigationBar.CustomNavigationBar()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.isHidden = true
        setupNavBar()
    }
    
    fileprivate func setupNavBar()
    {
        
        view.addSubview(navBar)
        
        // 设置自定义导航栏背景图片
//        navBar.barBackgroundImage = UIImage(named: "millcolorGrad")
        
        // 设置自定义导航栏背景颜色
         navBar.barBackgroundColor = UIColor.orange
        // 设置自定义导航栏标题颜色
        navBar.titleLabelColor = .white
        // 设置自定义导航栏左右按钮字体颜色
        navBar.easy_setTintColor(color: .white)
        
        if self.navigationController?.children.count != 1 {
            navBar.easy_setLeftButton(title: "back", titleColor: UIColor.white)
        }
    }
    
    @objc fileprivate func back()
    {
        _ = navigationController?.popViewController(animated: true)
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
