//
//  SFJContactInfoController.m
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/29.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJContactInfoController.h"
#import "SFJContactInfoHeaderView.h"
#import "SFJContactModel.h"
#import "SFJPhoneNumCell.h"

@interface SFJContactInfoController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) SFJContactInfoHeaderView *headerView;

@end

@implementation SFJContactInfoController

- (SFJContactInfoHeaderView *)headerView{
    
    if (!_headerView) {
        _headerView = [SFJContactInfoHeaderView headerView];
    }
    return _headerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self p_setupTableView];
    self.automaticallyAdjustsScrollViewInsets = YES;
}

- (void)p_setupTableView{
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SFJPhoneNumCell class]) bundle:nil] forCellReuseIdentifier:SFJPhoneNumCellID];
    
 
    // 隐藏cell多余的分割线
    _tableView.tableFooterView = [UIView new];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    self.headerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), SFJContactInfoHeaderViewHeight);
    _tableView.tableHeaderView = self.headerView;
    self.headerView.model = self.model;
}

#pragma mark -
#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model.phoneNums.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SFJPhoneNumCell *cell = [tableView dequeueReusableCellWithIdentifier:SFJPhoneNumCellID forIndexPath:indexPath];
    cell.phonenNum = self.model.phoneNums[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"电话";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}




@end
