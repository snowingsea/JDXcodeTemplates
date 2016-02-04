//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//___COPYRIGHT___
//

#import "JDBaseViewController.h"
#import "JDUtility.h"

@interface JDBaseViewController ()

@end

@implementation JDBaseViewController

#pragma mark - Life Circle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self initData];
    [self addViews];
    [self addEvents];
    [self configData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if ([self.screenName length] > 0) {
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if ([self.screenName length] > 0) {
    }
}

#pragma mark - 初始化

/**
 *  初始化数据
 */
- (void)initData
{
    self.screenName = STRING([self class]);
};

/**
 *  添加视图
 */
- (void)addViews
{
    // 去掉scrollView默认的顶部margin
    self.automaticallyAdjustsScrollViewInsets = NO;
}

/**
 *  初始化事件
 */
- (void)addEvents
{

}

/**
 *  配置数据
 */
- (void)configData
{

}

#pragma mark - 功能函数

/**
 *  移至上一个页面
 */
- (void)popback
{
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  过滤错误，无错误时回调
 *
 *  @param error    错误类
 *  @param callback 回调
 */
- (void)filterError:(NSError *)error callback:(void (^)(void))callback
{
    if (![self checkError:error] && callback) {
        callback();
    }
}

/**
 *  判断当前Controller是否正在显示
 *
 *  @return 显示与否
 */
- (BOOL)isVisible
{
    return self.isViewLoaded && self.view.window;
}

/**
 *  开启加载动画
 */
- (void)startLoading
{
    // 添加加载动画
}

/**
 *  停止加载动画
 */
- (void)stopLoading
{
    // 停止加载动画
}

#pragma mark -

/**
 *  判断是否有错误
 *
 *  @param error 错误类
 *
 *  @return 有错返回YES
 */
- (BOOL)checkError:(NSError *)error
{
    if (error) {
        // show Error
    }
    return error != nil;
}

@end
