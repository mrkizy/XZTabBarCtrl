# XZTabBarCtrl
<p>这是带有顶部toolBar的控制器，支持圆形小红点、数字小红点、多种图文样式，与APPLE官方控件-UITabBarViewController一样的代理设计模式，简单易用。</p>
<p>作者：kizy</p>
<p>QQ：358033194</p>
<a href="#case">案例</a><br>
<a href ="#use">使用教程</a>
<h1 name = "case">案例</h1>
<img src = "example1.png" style = "width: 200px; height: 300px;"\>
<img src = "example2.png" \>
<img src = "example3.png" \>
<h1 name ="use">How to use XZTabBarCtrl(如何使用XZTabBarCtrl)</h1>
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

<p style="color:red;"style="color:red;">//为顶部ToolBar添加需要显示的标题</p>
tabBarCtrl.toolBarTitles = @[@"第一个Item", @"第二个Item", @"第三个Item"];

//设置<a href="#delegate">代理</a>
tabBarCtrl.delegate = self;

//为顶部ToolBar设置显示样式，更多样式设置请看<a href = "#properties">属性</a>
tabBarCtrl.itemType = ToolBarItemType_leftToRight;  ／／ToolBarItemType_default（默认样式）、ToolBarItemType_leftToRight(图文左右排列)、ToolBarItemType_topToBottom（图文上下排列）
tabBarCtrl.toolBarImages = @[@"job_push_icon_blue", @"job_push_icon_blue", @"job_push_icon_blue"];//设置图片数组
tabBarCtrl.xzToolBarColor = [UIColor whiteColor]; ／／设置背景色
</pre>
<h3>子控制器获取对应toolBarItem</h3>
<ul>
<li>
Import the main file：<code>#import "XZTabBar.h"</code> in childViewController<br>
(子控制器中引用头文件<code>XZTabBar.h</code>)</li>
<li>显示小红点：<code>self.toolBarItem.budgeView.hidden = NO;</code></li>
<li>显示6个未读数字：<code>self.toolBarItem.bageVal = @"6";</code></li>
</ul>
<h3 name="properties">properties of XZTabBarCtrl:(属性)</h3>
<pre>
<span class="pl-k">@interface</span> <span class="pl-en">XZTabBarCtrl</span> : <span class="pl-e">UIViewController</span>

<code>//  代理</<code>code>
@property (nonatomic, weak) id<XZTabBarCtrlDelegate> delegate;

<code>//  @decription toolBarItem's title: 存放自定义tooleBar的标题数组
//  @warning    该属性可为空，为空表示不创建tooleBar</code>
@property (nonatomic, copy) NSArray *toolBarTitles;

<code>//  @decription toolBarItem's image: 存放自定义tooleBar的图片数组
//  @warning    该属性可为空，如需赋值，count大小需与toolBarTitles一致</code>
@property (nonatomic, copy) NSArray *toolBarImages;

<code>//  @decription toolBar's height: 设置toolBar的高度，默认高度为49.0f</code>
@property (nonatomic, assign) CGFloat toolBarHeight;

<code>//  @decription 自定义的toolBar
//  @warning    toolBar整个机制类似UITabBarController的tabBar：一个XZTabBarCtrl只有一个customeToolBar；每个子控制器拥有独立的ToolBarItem，可支持小红点、标题更改 etc, 子控制器获取该tooleBarItem需要引用文件"XZTabBar.h"</code>
@property (nonatomic, weak) UIView *customToolBar;

<code><code>//  @decription toolBarItem显示样式
//  ToolBarItemType_default,    //默认显示系统正常排列按钮
//  ToolBarItemType_normalImgText,    //左右图文按钮
//  ToolBarItemType_unnormalImgText,    //上下图文按钮</code></code>
@property (nonatomic, assign) ToolBarItemType itemType;

<code>//  @decription  控制toolBar的背景颜色，default is blackColor</code>
@property (nonatomic, strong) UIColor *xzToolBarColor;

<code>//  @decription  控制toolItem的文字正常显示颜色，default is grayColor</code>
@property (nonatomic, strong) UIColor *xzTitleColor;

<code>//  @decription  控制被选中toolItem的文字显示颜色，default is whiteColor</code>
@property (nonatomic, strong) UIColor *xzTitleSelectedColor;

<code>//  @decription 存放子控制器的数组
//  @warning    该属性不能为空，必须赋值</code>
@property (nonatomic, copy) NSMutableArray<__kindof UIViewController *> *childVCs;

<code>//  @decription  当前显示的控制器的Index
//  @warning    该属性用法类似UITabBarController的selectedIndex属性</code>
@property (nonatomic, assign) NSInteger selectedIndex;
</pre>
<h3 name="delegate">delegate:(代理)</h3>
<p>@protocol XZTabBarCtrlDelegate <NSObject></p>
<p class="pl-c">//点击时调用，返回即将显示控制器对应toolBarItem</p>
- (void)xzTabBarCtrl:(XZTabBarCtrl *)tabbarCtrl selectedItem:(ToolBarItem *)toolBarItem;

<p class="pl-c">//点击前调用，控制是否跳转</p>
- (BOOL)xzTabBarCtrl:(XZTabBarCtrl *)tabbarCtrl shouldSelectViewController:(UIViewController *)viewController;

<p class="pl-c">//点击时调用，返回即将显示控制器</p>
- (void)xzTabBarCtrl:(XZTabBarCtrl *)tabbarCtrl didSelectViewController:(UIViewController *)viewController;<br>
@end
