# XZTabBarCtrl
<p>这是带有顶部toolBar的控制器，支持圆形小红点、数字小红点、多种图文样式，与APPLE官方控件-UITabBarViewController一样的代理设计模式，简单易用。</p>
<p>作者：kizy</p>
<p>QQ：358033194</p>
<a href="#case">案例</a><br>
<a href = "#use">使用教程</a>
<h1 name = "case">案例</h1>
<img src = "example1.png" style = "width: 200px; height: 300px;"\>
<img src = "example2.png" \>
<img src = "example3.png" \>
<h1 name = "use">How to use XZTabBarCtrl(如何使用XZTabBarCtrl)</h1>
<ul>
<li>Manual import:(手动引用)
<ul>
<li>
Drag All files in the <code>XZTabBarCtrl</code>folder to project<br>
(将<code>XZTabBarCtrl</code>文件夹及子文件拉到你的项目中)
</li>
<li>
Import the main file：<code>#import "XZTabBar.h"</code><br>
(引用头文件<code>XZTabBar.h</code>)</li>
</ul>
</li>
</ul>
<h3>initialize:the same to UITabBarViewController(初始化:和UITabBarViewController)</h3>

<pre>
UIViewController *ctrl1 = [[UIViewController alloc] init];
UIViewController *ctrl2 = [[OneViewCtrl alloc] init];
UIViewController *ctrl3 = [[RedViewCtrl alloc] init];

XZTabBarCtrl *tabBarCtrl = [[XZTabBarCtrl alloc] init];
tabBarCtrl.childVCs = @[ctrl1, ctrl2, ctrl3];
tabBarCtrl.toolBarTitles = @[@"first", @"second", @"third"];
</pre>


