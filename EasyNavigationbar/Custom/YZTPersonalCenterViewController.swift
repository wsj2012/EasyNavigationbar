//
//  YZTPersonalCenterViewController.swift
//  YZTNavigationBarDemo
//
//  Created by 王树军(金融壹账通客户端研发团队) on 2018/11/20.
//  Copyright © 2018 王树军(金融壹账通客户端研发团队). All rights reserved.
//

import UIKit

private let HEADER_HEIGHT:CGFloat = 260
private let NAVBAR_COLORCHANGE_POINT:CGFloat = HEADER_HEIGHT - CGFloat(kNavBarBottom * 2)

class YZTPersonalCenterViewController: BaseViewController {
    
    lazy var headerView: UIView = {
        var header = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: HEADER_HEIGHT))
        header.backgroundColor = UIColor.orange
        return header
    }()
    
    lazy var tableView:UITableView = {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: self.view.bounds.height)
        let table:UITableView = UITableView(frame: frame, style: .plain)
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
        table.delegate = self
        table.dataSource = self
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.tableHeaderView = headerView
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        view.insertSubview(navBar, aboveSubview: tableView)
        
        navBar.title = "个人中心"
        // 设置导航栏颜色
        navBar.barBackgroundColor = UIColor(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0)
        // 设置初始导航栏透明度
        navBar.easy_setBackgroundAlpha(alpha: 0)
        // 设置标题文字颜色
        navBar.titleLabelColor = UIColor.white
        
//        navBar.easy_setLeftButtonHidden(hidden: true)
    }

}

// MARK: - ScrollViewDidScroll
extension YZTPersonalCenterViewController
{
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let offsetY = scrollView.contentOffset.y
        if (offsetY > NAVBAR_COLORCHANGE_POINT)
        {
            let alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / CGFloat(kNavBarBottom)
            navBar.easy_setBackgroundAlpha(alpha: alpha)
            navBar.easy_setTintColor(color: UIColor.black.withAlphaComponent(alpha))
            navBar.titleLabelColor = UIColor.black.withAlphaComponent(alpha)
            statusBarStyle = .default
        }
        else
        {
            navBar.easy_setBackgroundAlpha(alpha: 0)
            navBar.easy_setTintColor(color: .white)
            navBar.titleLabelColor = .white
            statusBarStyle = .lightContent
        }
    }
}

extension YZTPersonalCenterViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        let str = String(format: "YZTNavigationBar %zd", indexPath.row)
        cell.textLabel?.text = str
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc:BaseViewController = BaseViewController()
        vc.view.backgroundColor = UIColor.red
        vc.navBar.barBackgroundColor = UIColor.green
        let str = String(format: "右滑返回查看效果 ", indexPath.row)
        vc.navBar.title = str
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
