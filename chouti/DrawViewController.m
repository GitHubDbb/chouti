//
//  DrawViewController.m
//  chouti
//
//  Created by qianfeng on 15/12/28.
//  Copyright (c) 2015年 DBBPerson. All rights reserved.
//

#import "DrawViewController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface DrawViewController ()

@property(nonatomic,assign)CGRect leftVcFrame;
@property(nonatomic,assign)CGRect centerVcframe;

@end

@implementation DrawViewController

-(id)initWithLeftViewController:(UIViewController *)leftVc andCenterViewController:(UIViewController *)centerVc{
    if (self = [super init]) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
        imageView.image = [UIImage imageNamed:@"bg"];
        imageView.userInteractionEnabled = YES;
        [self.view addSubview:imageView];
        self.leftVc = leftVc;
        self.centerVc = centerVc;
        
        [self addChildViewController:self.leftVc];
        [self addChildViewController:self.centerVc];
        
        self.leftVc.view.frame = CGRectMake(-ScreenWidth, 0, ScreenWidth, ScreenHeight);
        self.centerVc.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        
        [self.view addSubview:self.centerVc.view];
        [self.view addSubview:self.leftVc.view];
        
        UIPanGestureRecognizer * panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
        [self.view addGestureRecognizer:panGesture];
    }
    return self;
}

-(void)pan:(UIPanGestureRecognizer*)pan{
    CGPoint point = [pan translationInView:self.view];
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            _leftVcFrame = self.leftVc.view.frame;
            _centerVcframe = self.centerVc.view.frame;
        }
            break;
        case UIGestureRecognizerStateChanged:{
            self.leftVc.view.frame = CGRectMake(_leftVcFrame.origin.x + point.x, _leftVcFrame.origin.y, ScreenWidth, ScreenHeight);
            self.centerVc.view.frame = CGRectMake(_centerVcframe.origin.x+point.x, _centerVcframe.origin.y + point.x, ScreenWidth, ScreenHeight);
        }
            break;
        case UIGestureRecognizerStateEnded:{
            if (self.leftVc.view.frame.origin.x > 100 - ScreenWidth) {
                [self showLeftVc];
            }
            else{
                [self showCenterVc];
            }
        }
        default:
            break;
    }
}

-(void)showLeftVc{
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:kNOTIFICATION_showLeftVc object:nil userInfo:@{@"test":@"914",@"fire in the home":@"booooom"}];
    [UIView animateWithDuration:0.5 animations:^{
        self.leftVc.view.frame = CGRectMake(250-ScreenWidth, 0, ScreenWidth, ScreenHeight);
        self.centerVc.view.frame = CGRectMake(self.leftVc.view.frame.origin.x +  ScreenWidth, 40,ScreenWidth, ScreenHeight-80);
    }];
}

-(void)showCenterVc{
    [[NSNotificationCenter defaultCenter]postNotificationName:kNOTIFICATION_ShowCenterVc object:nil];
    [UIView animateWithDuration:0.5 animations:^{
        self.leftVc.view.frame = CGRectMake(-ScreenWidth, 0, ScreenWidth, ScreenHeight);
        self.centerVc.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
