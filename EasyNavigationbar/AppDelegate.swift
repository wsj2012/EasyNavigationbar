//
//  AppDelegate.swift
//  EasyNavigationbar
//
//  Created by 王树军 on 2018/12/7.
//  Copyright © 2018 王树军. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        let firstNav = BaseNavigationController.init(rootViewController: FirstViewController())
        let secondNav = BaseNavigationController.init(rootViewController: SecondViewController())
        let tabBarVC = UITabBarController.init()
        tabBarVC.viewControllers = [firstNav, secondNav]
        setTabBarItems(tabBarVC: tabBarVC)
        
        window?.rootViewController = tabBarVC
        setNavBarAppearence()
        window?.makeKeyAndVisible()
        return true
    }
    
    func setTabBarItems(tabBarVC:UITabBarController)
    {
        let titles = ["Normal",  "Custom", ];
        //        let normalImages = ["mine",
        //                            "mine",
        //                            "mine"];
        //        let highlightImages = ["mineHighlight",
        //                               "mineHighlight",
        //                               "mineHighlight"];
        for (index, item) in tabBarVC.tabBar.items!.enumerated()
        {
            item.title = titles[index]
            //            item.image = UIImage(named: normalImages[index])?.withRenderingMode(.alwaysOriginal)
            //            item.selectedImage = UIImage(named: highlightImages[index])?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    func setNavBarAppearence()
    {
        // 设置导航栏默认的背景颜色
        EasyNavigationBar.defaultNavBarBarTintColor = UIColor.init(red: 0/255.0, green: 175/255.0, blue: 240/255.0, alpha: 1)
        // 设置导航栏所有按钮的默认颜色
        EasyNavigationBar.defaultNavBarTintColor = .white
        // 设置导航栏标题默认颜色
        EasyNavigationBar.defaultNavBarTitleColor = .white
        // 统一设置状态栏样式
        EasyNavigationBar.defaultStatusBarStyle = .lightContent
        // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
        EasyNavigationBar.defaultShadowImageHidden = true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

