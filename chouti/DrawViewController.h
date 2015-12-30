//
//  DrawViewController.h
//  chouti
//
//  Created by qianfeng on 15/12/28.
//  Copyright (c) 2015年 DBBPerson. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kNOTIFICATION_showLeftVc @"showLeft"
#define kNOTIFICATION_ShowCenterVc @"showCenter"

@interface DrawViewController : UIViewController

@property(nonatomic,retain)UIViewController * leftVc;
@property(nonatomic,retain)UIViewController * centerVc;

-(id)initWithLeftViewController:(UIViewController*)leftVc andCenterViewController:(UIViewController * )centerVc;

-(void)showLeftVc;
-(void)showCenterVc;



@end
