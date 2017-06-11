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
<h3>initialize：the same to UITabBarViewController(初始化:和UITabBarViewController)</h3>

<pre>
UIViewController *ctrl1 = [[UIViewController alloc] init];
UIViewController *ctrl2 = [[OneViewCtrl alloc] init];
UIViewController *ctrl3 = [[RedViewCtrl alloc] init];

<span class="pl-c1">XZTabBarCtrl</span> *tabBarCtrl = [[<span class="pl-c1">XZTabBarCtrl</span> alloc] init];

<span class="pl-c">//将子控制器加入childVCs，用法类似UITabBarViewController的viewControllers</span>
tabBarCtrl.childVCs = @[ctrl1, ctrl2, ctrl3];

<span class="pl-c">为顶部ToolBar添加需要显示的标题</span>
tabBarCtrl.toolBarTitles = @[@"第一个Item", @"第二个Item", @"第三个Item"];
</pre>
<pre><span class="pl-k">@interface</span> <span class="pl-en">MJRefreshFooter</span> : <span class="pl-e">MJRefreshComponent</span>
<span class="pl-c"><span class="pl-c">/*</span>* Creat footer <span class="pl-c">*/</span></span>
+ (<span class="pl-k">instancetype</span>)<span class="pl-en">footerWithRefreshingBlock</span><span class="pl-en">:</span>(MJRefreshComponentRefreshingBlock)<span class="pl-smi">refreshingBlock</span>;
<span class="pl-c"><span class="pl-c">/*</span>* Creat footer <span class="pl-c">*/</span></span>
+ (<span class="pl-k">instancetype</span>)<span class="pl-en">footerWithRefreshingTarget</span><span class="pl-en">:</span>(<span class="pl-c1">id</span>)<span class="pl-smi">target</span> <span class="pl-en">refreshingAction</span><span class="pl-en">:</span>(<span class="pl-c1">SEL</span>)<span class="pl-smi">action</span>;

<span class="pl-c"><span class="pl-c">/*</span>* NoticeNoMoreData <span class="pl-c">*/</span></span>
- (<span class="pl-k">void</span>)<span class="pl-en">noticeNoMoreData</span>;
<span class="pl-c"><span class="pl-c">/*</span>* ResetNoMoreData（Clear the status of NoMoreData ） <span class="pl-c">*/</span></span>
- (<span class="pl-k">void</span>)<span class="pl-en">resetNoMoreData</span>;

<span class="pl-c"><span class="pl-c">/*</span>* Ignored scrollView contentInset bottom <span class="pl-c">*/</span></span>
<span class="pl-k">@property</span> (<span class="pl-k">assign</span>, <span class="pl-k">nonatomic</span>) <span class="pl-c1">CGFloat</span> ignoredScrollViewContentInsetBottom;

<span class="pl-c"><span class="pl-c">/*</span>* Automaticlly show or hidden by the count of data（Show-have data，Hidden- no data） <span class="pl-c">*/</span></span>
<span class="pl-k">@property</span> (<span class="pl-k">assign</span>, <span class="pl-k">nonatomic</span>) <span class="pl-c1">BOOL</span> automaticallyHidden;
<span class="pl-k">@end</span></pre>


