# EasyNavigationbar
定制UINavigationBar样式，可全局统一设置默认样式，在各页面灵活定制自己的样式。

## Setup Instructions

To integrate YZTNavigationBar into your Xcode project using CocoaPods, specify it in your Podfile:

pod 'YZTNavigationBar', and in your code add import YZTNavigationBar.

## Manually

Just add YZTNavigationBar folder to your project.

## Basic Examples


* 1、Normal style

![ScreenShot](https://github.com/wsj2012/YZTNavigationBar/blob/master/System.png?raw=true)


```
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

* 2、Custom Style

![baidu](https://github.com/wsj2012/YZTNavigationBar/blob/master/Custom.gif?raw=true) 

```

func setNavbarAppearanc() {
// 设置导航栏颜色
navBar.barBackgroundColor = UIColor(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0)
// 设置初始导航栏透明度
navBar.yzt_setBackgroundAlpha(alpha: 0)
// 设置标题文字颜色
navBar.titleLabelColor = UIColor.white
navBar.yzt_setRightButton(title: "设置", titleColor: .white)
statusBarStyle = .lightContent
navBar.onClickRightButton = {

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
navBar.yzt_setBackgroundAlpha(alpha: alpha)
navBar.yzt_setTintColor(color: UIColor.black.withAlphaComponent(alpha))
navBar.titleLabelColor = UIColor.black.withAlphaComponent(alpha)
statusBarStyle = .default
}
else
{
navBar.yzt_setBackgroundAlpha(alpha: 0)
navBar.yzt_setTintColor(color: .white)
navBar.titleLabelColor = .white
statusBarStyle = .lightContent
}
}
}

```

If you have questions, you can see demo.



## Compatibility

* Version 1.0.1 requires Swift 4.2 and Xcode 10.
