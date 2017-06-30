//
//  ViewController.m
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/27.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "ViewController.h"
#import <AddressBookUI/ABPeoplePickerNavigationController.h>
#import <AddressBook/ABPerson.h>
#import <AddressBookUI/ABPersonViewController.h>
#import "SFJAddressBook.h"

#import "SFJAddressBookController.h"

#import "UIImage+SFJExtension.h"
@interface ViewController ()<ABPeoplePickerNavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    ABPeoplePickerNavigationController *nav = [[ABPeoplePickerNavigationController alloc] init];
//    nav.peoplePickerDelegate = self;
//    nav.predicateForSelectionOfPerson = [NSPredicate predicateWithValue:NO];
//    
//    [self presentViewController:nav animated:YES completion:nil];
}

- (IBAction)act:(UIButton *)sender {
    UIImage *img = [UIImage circleImageWithSize:60 color:[UIColor orangeColor]];
    [sender setBackgroundImage:img forState:UIControlStateNormal];
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)addressBook:(id)sender {
    SFJAddressBookController *vc = [[SFJAddressBookController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  
//    [self presentViewController:[[SFJAddressBookController alloc] init] animated:YES completion:nil];
    
    
    
}

@end
