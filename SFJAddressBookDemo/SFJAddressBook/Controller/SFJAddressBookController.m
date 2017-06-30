//
//  SFJAddressBookController.m
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/28.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJAddressBookController.h"
#import "SFJContactCell.h"
#import "SFJAddressBook.h"
#import "SFJContactInfoController.h"

@interface SFJAddressBookController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *titles_;
    NSArray *sections_;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation SFJAddressBookController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupTableView];
    [self p_loadData];
}

- (void)p_setupTableView{
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SFJContactCell class]) bundle:nil] forCellReuseIdentifier:SFJContactCellID];
}

- (void)p_loadData{
    titles_ = [[SFJAddressBook shareAddressBook] sectionIndexTitles];
    sections_ = [[SFJAddressBook shareAddressBook] sections];
}

#pragma mark -
#pragma mark - <UITableViewDataSource, UITableViewDelegate>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [sections_ count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [sections_[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SFJContactCell *cell = [tableView dequeueReusableCellWithIdentifier:SFJContactCellID forIndexPath:indexPath];
    cell.model = sections_[indexPath.section][indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

    return titles_[section];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{

    return titles_;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SFJContactInfoController *vc = [[SFJContactInfoController alloc] init];
    vc.model = sections_[indexPath.section][indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
