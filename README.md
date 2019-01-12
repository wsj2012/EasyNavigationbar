# EasyNavigationbar
定制UINavigationBar样式，可全局统一设置默认样式，在各页面灵活定制自己的样式。

## Setup Instructions

To integrate EasyNavigationBar into your Xcode project using CocoaPods, specify it in your Podfile:

pod 'EasyNavigationBar', and in your code add import EasyNavigationBar.

## Manually

Add `EasyNavigationBar.swift` to your project.

## Basic Examples


* Normal style

![ScreenShot](https://github.com/wsj2012/EasyNavigationBar/blob/master/System.png?raw=true)


```swift
func setNavbarAppearance() {
	// 导航栏颜色
	navBarBarTintColor = .white
	// 导航栏透明度
	navBarBackgroundAlpha = 1
	// 导航栏两边按钮颜色
	navBarTintColor = .black
	// 导航栏上标题颜色
	navBarTitleColor = .black
	// 导航栏底部分割线是否隐藏
	navBarShadowImageHidden = true;
	// 状态栏是 default 还是 lightContent
	statusBarStyle = .default
}
```

* Custom Style

![baidu](https://github.com/wsj2012/EasyNavigationBar/blob/master/Custom.gif?raw=true) 

```swift

private let HEADER_HEIGHT:CGFloat = 260
private let NAVBAR_COLORCHANGE_POINT:CGFloat = HEADER_HEIGHT - CGFloat(kNavBarBottom * 2)

func setNavbarAppearanc() {
	// 设置导航栏颜色
	navBar.barBackgroundColor = UIColor(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0)
	// 设置初始导航栏透明度
	navBar.easy_setBackgroundAlpha(alpha: 0)
	// 设置标题文字颜色
	navBar.titleLabelColor = UIColor.white
	navBar.easy_setRightButton(title: "设置", titleColor: .white)
	statusBarStyle = .lightContent
	navBar.onRightButtonDidClick = {
	
	}
}

// MARK: - ScrollViewDidScroll
extension ViewController
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
		} else {
			navBar.easy_setBackgroundAlpha(alpha: 0)
			navBar.easy_setTintColor(color: .white)
			navBar.titleLabelColor = .white
			statusBarStyle = .lightContent
		}
	}
}

```

If you have questions, you can see demo.



## Compatibility

* Version 1.0.1 requires Swift 4.2 and Xcode 10.
