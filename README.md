# SHWelcomePageController

简书地址:https://www.jianshu.com/p/f57f5565eb58

首次启动app欢迎引导页控制器, 可直接导入项目中使用
这是一个SHWelcomePageController, 里面提供以下属性及初始化方法:
```
/// 可通过NSUserDefault取得这个key的bool值, 判断是否第一次启动app,
/// 不等于YES时候表示是第一次启动, 否则不是第一次启动
static NSString *SHWelcomeIsLaunchDefaultKey = @"isLaunch";

@interface SHWelcomePageController : UIViewController

/// 翻页小圆点, 可自行设置它的参数
@property (nonatomic, weak)UIPageControl *pageControl;
/// "立即体验"按钮, 可自行设置位置及样式参数, 默认是"立即体验"
@property (nonatomic, weak)UIButton *showRootControllerBtn;


/**
 初始化方法

 @param imageArr 图片名称的字符串数组
 @param rootVC 点击"立即体验"后跳转的控制器
 @return 欢迎页控制器
 */
- (SHWelcomePageController *)initWithImageNameArray:(NSArray *)imageArr rootViewController:(UIViewController *)rootVC;
```
###使用方法:
使用时候只需把demo里面的SHWelcomePageController这个文件夹拖到项目中, 然后在appDelegate里面判断是否首次启动app并初始化.

SHWelcomePageController提供SHWelcomeIsLaunchDefaultKey这个东西, 它是userDefault里面的一个key, 当点击立即体验进入app首页后, SHWelcomePageController内部会自动修改这个key值, 使用者可以判断这个key值来知道是否首次启动app.

SHWelcomePageController提供pageControl和showRootControllerBtn两个属性, 使用者可以自行设置小圆点和"立即体验"按钮的样式颜色和位置等等.

具体使用代码如下图:
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UIViewController *homeVC = [[UIViewController alloc] init];
    homeVC.view.backgroundColor = [UIColor redColor];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // 通过取SHWelcomeIsLaunchDefaultKey的值来判断是否首次启动app
    if ([defaults boolForKey:SHWelcomeIsLaunchDefaultKey] != YES) {
        // 是第一次启动
        NSArray *imgArr = @[@"welcome1", @"welcome2", @"welcome3"];
        SHWelcomePageController *welcomeVC = [[SHWelcomePageController alloc] initWithImageNameArray:imgArr rootViewController:homeVC];
        // 可自行设置小圆点的位置及属性, "立即体验"按钮的位置及属性
        // welcomeVC.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        // [welcomeVC.showRootControllerBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.window.rootViewController = welcomeVC;
    }else{
        // 不是第一次启动
        self.window.rootViewController = homeVC;
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}
```
