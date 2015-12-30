//
//  LeftViewController.m
//  chouti
//
//  Created by qianfeng on 15/12/28.
//  Copyright (c) 2015年 DBBPerson. All rights reserved.
//

#import "LeftViewController.h"
#import "AppDelegate.h"
#import "DrawViewController.h"
#import "VIPViewController.h"

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)NSMutableArray * dataSourse;
@property(nonatomic,retain)UITableView * tableView;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor yellowColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourse.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = self.dataSourse[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentRight;
    
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==3) {
        VIPViewController * vip = [[VIPViewController alloc]init];
        [self presentViewController:vip animated:NO completion:^{
            AppDelegate * delegate = [UIApplication sharedApplication].delegate;
            DrawViewController * drawVc = (DrawViewController*)delegate.window.rootViewController;
            [drawVc showCenterVc];
            
        }];
        
    }
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(NSMutableArray *)dataSourse{
    if (!_dataSourse) {
        _dataSourse = [[NSMutableArray alloc]initWithObjects:@"",@"",@"",@"开通会员",@"QQ 钱包",@"我的收藏",@"我的相册",@"我的文件", nil];
    }
    return _dataSourse;
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
