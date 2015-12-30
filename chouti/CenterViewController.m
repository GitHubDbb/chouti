//
//  CenterViewController.m
//  chouti
//
//  Created by qianfeng on 15/12/28.
//  Copyright (c) 2015年 DBBPerson. All rights reserved.
//

#import "CenterViewController.h"
#import "DrawViewController.h"
#import "AppDelegate.h"

@interface CenterViewController ()
@property(nonatomic,retain)UIView * maskView;
@end

@implementation CenterViewController
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:kNOTIFICATION_ShowCenterVc object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:kNOTIFICATION_showLeftVc object:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"头像" style:UIBarButtonItemStyleDone target:self action:@selector(onClick)];
    [self registerNotification];
}

-(void)registerNotification{
    NSNotificationCenter * notification = [NSNotificationCenter defaultCenter];
    [notification addObserver:self selector:@selector(no:) name:kNOTIFICATION_showLeftVc object:nil];
    [notification addObserver:self selector:@selector(hideMaskView) name:kNOTIFICATION_ShowCenterVc object:nil];
}

-(void)no:(NSNotification*)no{
    
}

-(void)hideMaskView{
    [self.maskView removeFromSuperview];
}

-(void)showMaskView{
    [self.view addSubview:self.maskView];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.maskView addGestureRecognizer:tap];
}

-(void)tap:(UITapGestureRecognizer*)tap{
    if (self.maskView == tap.view) {
        AppDelegate * delegate = [UIApplication sharedApplication].delegate;
        DrawViewController * drawVc = (DrawViewController*)delegate.window.rootViewController;
        [drawVc showCenterVc];
        [self.maskView removeFromSuperview];
    }
}

-(void)onClick{
    AppDelegate * delegate = [UIApplication sharedApplication].delegate;
    DrawViewController * drawVc = (DrawViewController*)delegate.window.rootViewController;
    [drawVc showLeftVc];
    [self showMaskView];
    
}

-(UIView *)maskView{
    if (_maskView ==nil) {
        _maskView = [[UIView alloc]initWithFrame:self.view.frame];
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha = 0.1;
    }
    return _maskView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
