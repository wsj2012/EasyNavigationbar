//
//  EasyCustomNavigationBar.swift
//  EasyNavigationbar
//
//  Created by 王树军 on 2018/12/7.
//  Copyright © 2018 王树军. All rights reserved.
//

import UIKit

fileprivate let EasyDefaultTitleSize:CGFloat = 18
fileprivate let EasyDefaultTitleColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
fileprivate let EasyDefaultBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
fileprivate let EasyScreenWidth = UIScreen.main.bounds.size.width

open class EasyCustomNavigationBar: UIView {
    
    public var onLeftButtonDidClick:(()->())?
    public var onRightButtonDidClick:(()->())?
    public var title:String? {
        willSet {
            titleLabel.isHidden = false
            titleLabel.text = newValue
        }
    }
    public var titleLabelColor:UIColor? {
        willSet {
            titleLabel.textColor = newValue
        }
    }
    public var titleLabelFont:UIFont? {
        willSet {
            titleLabel.font = newValue
        }
    }
    public var barBackgroundColor:UIColor? {
        willSet {
            backgroundImageView.isHidden = true
            backgroundView.isHidden = false
            backgroundView.backgroundColor = newValue
        }
    }
    public var barBackgroundImage:UIImage? {
        willSet {
            backgroundView.isHidden = true
            backgroundImageView.isHidden = false
            backgroundImageView.image = newValue
        }
    }
    
    // fileprivate UI variable
    fileprivate lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textColor = EasyDefaultTitleColor
        label.font = UIFont.systemFont(ofSize: EasyDefaultTitleSize)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    fileprivate lazy var leftButton:UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .center
        button.isHidden = true
        button.addTarget(self, action: #selector(clickBack), for: .touchUpInside)
        return button
    }()
    
    fileprivate lazy var rightButton:UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .center
        button.isHidden = true
        button.addTarget(self, action: #selector(clickRight), for: .touchUpInside)
        return button
    }()
    
    fileprivate lazy var bottomLine:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: (218.0/255.0), green: (218.0/255.0), blue: (218.0/255.0), alpha: 1.0)
        return view
    }()
    
    fileprivate lazy var backgroundView:UIView = {
        let view = UIView()
        return view
    }()
    
    fileprivate lazy var backgroundImageView:UIImageView = {
        let imgView = UIImageView()
        imgView.isHidden = true
        return imgView
    }()
    
    
    fileprivate static var navBarHeight:Int {
        get {
            return EasyNavigationBar.isIphoneX() ? 88 : 64
        }
    }
    
    // init
    public static func CustomNavigationBar() -> EasyCustomNavigationBar {
        let frame = CGRect(x: 0, y: 0, width: EasyScreenWidth, height: CGFloat(navBarHeight))
        return EasyCustomNavigationBar(frame: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView()
    {
        addSubview(backgroundView)
        addSubview(backgroundImageView)
        addSubview(leftButton)
        addSubview(titleLabel)
        addSubview(rightButton)
        addSubview(bottomLine)
        updateFrame()
        backgroundColor = .clear
        backgroundView.backgroundColor = EasyDefaultBackgroundColor
    }
    private func updateFrame()
    {
        let top:CGFloat = EasyNavigationBar.isIphoneX() ? 44 : 20
        let margin:CGFloat = 20
        let buttonHeight:CGFloat = 44
        let buttonWidth:CGFloat = 44
        let titleLabelHeight:CGFloat = 44
        let titleLabelWidth:CGFloat = 180
        
        backgroundView.frame = self.bounds
        backgroundImageView.frame = self.bounds
        leftButton.frame = CGRect(x: margin, y: top, width: buttonWidth, height: buttonHeight)
        rightButton.frame = CGRect(x: EasyScreenWidth-buttonWidth-margin, y: top, width: buttonWidth, height: buttonHeight)
        titleLabel.frame = CGRect(x: (EasyScreenWidth-titleLabelWidth)/2.0, y: top, width: titleLabelWidth, height: titleLabelHeight)
        bottomLine.frame = CGRect(x: 0, y: bounds.height-0.5, width: EasyScreenWidth, height: 0.5)
        leftButton.contentHorizontalAlignment = .left
        rightButton.contentHorizontalAlignment = .right
    }
    
}

extension EasyCustomNavigationBar
{
    
    public func easy_setBottomLineHidden(hidden:Bool) {
        bottomLine.isHidden = hidden
    }
    public func easy_setLeftButtonHidden(hidden: Bool) {
        leftButton.isHidden = hidden
    }
    public func easy_setRightButtonHidden(hidden: Bool) {
        rightButton.isHidden = hidden
    }
    public func easy_setBackgroundAlpha(alpha:CGFloat) {
        backgroundView.alpha = alpha
        backgroundImageView.alpha = alpha
        bottomLine.alpha = alpha
    }
    public func easy_setTintColor(color:UIColor) {
        leftButton.setTitleColor(color, for: .normal)
        rightButton.setTitleColor(color, for: .normal)
        titleLabel.textColor = color
    }
    
    // 左右按钮共有方法
    public func easy_setLeftButton(normal:UIImage, highlighted:UIImage) {
        easy_setLeftButton(normal: normal, highlighted: highlighted, title: nil, titleColor: nil)
    }
    public func easy_setLeftButton(image:UIImage) {
        easy_setLeftButton(normal: image, highlighted: image, title: nil, titleColor: nil)
    }
    public func easy_setLeftButton(title:String, titleColor:UIColor) {
        easy_setLeftButton(normal: nil, highlighted: nil, title: title, titleColor: titleColor)
    }
    
    public func easy_setRightButton(normal:UIImage, highlighted:UIImage) {
        easy_setRightButton(normal: normal, highlighted: highlighted, title: nil, titleColor: nil)
    }
    public func easy_setRightButton(image:UIImage) {
        easy_setRightButton(normal: image, highlighted: image, title: nil, titleColor: nil)
    }
    public func easy_setRightButton(title:String, titleColor:UIColor) {
        easy_setRightButton(normal: nil, highlighted: nil, title: title, titleColor: titleColor)
    }
    
    // 左右按钮私有方法
    private func easy_setLeftButton(normal:UIImage?, highlighted:UIImage?, title:String?, titleColor:UIColor?) {
        leftButton.isHidden = false
        leftButton.setImage(normal, for: .normal)
        leftButton.setImage(highlighted, for: .highlighted)
        leftButton.setTitle(title, for: .normal)
        leftButton.setTitleColor(titleColor, for: .normal)
    }
    private func easy_setRightButton(normal:UIImage?, highlighted:UIImage?, title:String?, titleColor:UIColor?) {
        rightButton.isHidden = false
        rightButton.setImage(normal, for: .normal)
        rightButton.setImage(highlighted, for: .highlighted)
        rightButton.setTitle(title, for: .normal)
        rightButton.setTitleColor(titleColor, for: .normal)
    }
}


// MARK: - 导航栏左右按钮事件
extension EasyCustomNavigationBar
{
    @objc func clickBack() {
        if let onClickBack = onLeftButtonDidClick {
            onClickBack()
        } else {
            let currentVC = UIViewController.easy_currentViewController()
            currentVC.easy_toLastViewController(animated: true)
        }
    }
    @objc func clickRight() {
        if let onClickRight = onRightButtonDidClick {
            onClickRight()
        }
    }
}

// MARK: - Router
extension UIViewController
{
    //  A页面 弹出 登录页面B
    //  presentedViewController:    A页面
    //  presentingViewController:   B页面
    
    public func easy_toLastViewController(animated:Bool) {
        if self.navigationController != nil
        {
            if self.navigationController?.viewControllers.count == 1
            {
                self.dismiss(animated: animated, completion: nil)
            } else {
                self.navigationController?.popViewController(animated: animated)
            }
        }
        else if self.presentingViewController != nil {
            self.dismiss(animated: animated, completion: nil)
        }
    }
    
    public static func easy_currentViewController() -> UIViewController {
        if let rootVC = UIApplication.shared.delegate?.window??.rootViewController {
            return self.easy_currentViewController(from: rootVC)
        } else {
            return UIViewController()
        }
    }
    
    public static func easy_currentViewController(from fromVC:UIViewController) -> UIViewController {
        if fromVC.isKind(of: UINavigationController.self) {
            let navigationController = fromVC as! UINavigationController
            return easy_currentViewController(from: navigationController.viewControllers.last!)
        }
        else if fromVC.isKind(of: UITabBarController.self) {
            let tabBarController = fromVC as! UITabBarController
            return easy_currentViewController(from: tabBarController.selectedViewController!)
        }
        else if fromVC.presentedViewController != nil {
            return easy_currentViewController(from:fromVC.presentingViewController!)
        }
        else {
            return fromVC
        }
    }
}
