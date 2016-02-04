//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAMEASIDENTIFIER___ViewController.h"
#import "___FILEBASENAMEASIDENTIFIER___ViewController+Main.h"
#import "___FILEBASENAMEASIDENTIFIER___MainView.h"

@interface ___FILEBASENAMEASIDENTIFIER___ViewController ()
@property(nonatomic, weak, readonly)___FILEBASENAMEASIDENTIFIER___MainView *mainView;
@end

@implementation ___FILEBASENAMEASIDENTIFIER___ViewController

#pragma mark - Life Circle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 初始化

- (void)initData
{
    [super initData];
    // 初始化数据
}

- (void)addViews
{
    [super addViews];
    
    // 添加主视图
    ___FILEBASENAMEASIDENTIFIER___MainView *mainView = [[___FILEBASENAMEASIDENTIFIER___MainView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:mainView];
    _mainView = mainView;
    
    // 添加其他视图
}

- (void)addEvents
{
    [super addEvents];
    
    // 添加主视图事件
    [self addMainEvents];
    
    // 添加其他视图事件
}

- (void)configData
{
    [super configData];
    // 配置数据，并更新UI
}

#pragma mark -

@end
