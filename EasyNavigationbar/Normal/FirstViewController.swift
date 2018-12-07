//
//  FirstViewController.swift
//  YZTNavigationBarDemo
//
//  Created by 王树军(金融壹账通客户端研发团队) on 2018/11/20.
//  Copyright © 2018 王树军(金融壹账通客户端研发团队). All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    lazy var tableView:UITableView = {
        let tableView:UITableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: self.view.bounds.height), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.register(YZTSettingsCell.classForCoder(), forCellReuseIdentifier: "YZTSettingsCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Normal"
        self.view.backgroundColor = UIColor.lightGray
        setNavbarAppearance()
        
        self.view.addSubview(self.tableView)
        
    }
    
    func setNavbarAppearance() {
        // 一行代码搞定导航栏颜色
        navBarBarTintColor = .white
        // 一行代码搞定导航栏透明度
        navBarBackgroundAlpha = 1
        // 一行代码搞定导航栏两边按钮颜色
        navBarTintColor = .black
        // 一行代码搞定导航栏上标题颜色
        navBarTitleColor = .black
        // 一行代码搞定导航栏底部分割线是否隐藏
        navBarShadowImageHidden = true;
        // 一行代码搞定状态栏是 default 还是 lightContent
        statusBarStyle = .default
    }


}

extension FirstViewController:UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell! = self.tableView.dequeueReusableCell(withIdentifier: "YZTSettingsCell")
        cell.textLabel!.text = "ABCDEFG"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let settingViewController = YZTSettingMoreViewController()
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

