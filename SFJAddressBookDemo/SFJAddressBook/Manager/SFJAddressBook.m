//
//  SFJAddressBook.m
//  SFJAddressBookDemo
//
//  Created by 沙缚柩 on 2017/6/28.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJAddressBook.h"
#import "SFJContactModel.h"
#import <AddressBook/AddressBook.h>

@interface SFJAddressBook ()

@end

@implementation SFJAddressBook

static SFJAddressBook *addressBook = nil;
+ (instancetype)shareAddressBook{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        addressBook = [[self alloc] init];
    });
    return addressBook;
}

- (void)requestAuthorizationAddressBook{
    // 判断是否授权
    ABAuthorizationStatus authorizationStatus = ABAddressBookGetAuthorizationStatus();
    if (authorizationStatus == kABAuthorizationStatusNotDetermined) {
        // 请求授权
        ABAddressBookRef addressBookRef =  ABAddressBookCreate();
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
            if (granted) {  // 授权成功
                
            } else {        // 授权失败
                NSLog(@"授权失败！");
            }
        });
    }
}

- (NSArray *)loadContacts{
    CFErrorRef *error = NULL;
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
        return [self p_loadContactsFromAddressBook:addressBook];
    }else{
        // 再次请求授权
        // 请求授权
        __block NSArray *arr = nil;
        ABAddressBookRef addressBookRef =  ABAddressBookCreate();
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
            if (granted) {  // 授权成功
                arr = [self p_loadContactsFromAddressBook:addressBookRef];
            } else {        // 授权失败
                arr = nil;
                NSLog(@"授权失败！");
            }
        });
        return arr;
    }
}

- (NSArray *)p_loadContactsFromAddressBook:(ABAddressBookRef)addressBook{
    
    NSMutableArray *models = [NSMutableArray array];
    CFIndex count = ABAddressBookGetPersonCount(addressBook);
    CFArrayRef peopleArr = ABAddressBookCopyArrayOfAllPeople(addressBook);
    for (int i=0 ; i < count; i++) {
        ABRecordRef person = CFArrayGetValueAtIndex(peopleArr, i);
        NSString *firstName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonFirstNameProperty));
        NSString *lastName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonLastNameProperty));
        
        ABMultiValueRef phone = ABRecordCopyValue(person, kABPersonPhoneProperty);
        NSMutableArray *phoneArr = [NSMutableArray array];
        for (int k=0; k < ABMultiValueGetCount(phone); k++) {
            //获取电话Label
//            NSString * personPhoneLabel = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(ABMultiValueCopyLabelAtIndex(phone, k));
            
//            NSLog(@"personPhoneLabel %@",personPhoneLabel);
            //获取該Label下的电话值
            NSString * personPhone = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phone, k);
//            [phoneArr addObject:personPhoneLabel];
            [phoneArr addObject:personPhone];
        }
        
        SFJContactModel *model = [[SFJContactModel alloc] init];
        model.firstName = firstName;
        model.lastName = lastName;
        model.phoneNums = phoneArr;
        [models addObject:model];
        
        CFRelease(person);
        CFRelease(phone);
    }
    
    CFRelease(peopleArr);
//    CFRelease(addressBook);
    return models;
}

- (NSArray *)p_contactsGroups{
    NSMutableArray *sectionArr = [NSMutableArray array];
    UILocalizedIndexedCollation *curCollection = [UILocalizedIndexedCollation currentCollation];
    for (int i = 0; i < curCollection.sectionTitles.count; i++) {
        NSMutableArray *subArr = [NSMutableArray array];
        [sectionArr addObject:subArr];
    }
    
    NSArray *models = [self loadContacts];
    for (SFJContactModel *model in models) {
        
        NSInteger section = [curCollection sectionForObject:model collationStringSelector:@selector(name)];
        NSLog(@"%@",model.name);
        [sectionArr[section] addObject:model];
    }
    
    for (NSMutableArray *subArr in sectionArr) {
        NSArray *sortArr = [curCollection sortedArrayFromArray:subArr collationStringSelector:@selector(name)];
        [subArr removeAllObjects];
        [subArr addObjectsFromArray:sortArr];
    }
    return sectionArr;
}

- (NSArray *)sections{
    NSArray *groups = [self p_contactsGroups];
    NSMutableArray *resultArr = [NSMutableArray array];
    for (NSArray *section in groups) {
        if (section.count > 0) {
            [resultArr addObject:section];
        }
    }
    return resultArr;
}

- (NSArray *)sectionIndexTitles{
    NSMutableArray *titles = [NSMutableArray array];
    NSArray *sections = [self p_contactsGroups];
    NSArray *sectionIndexTitles = [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
    for (int i = 0; i < sections.count; i++) {
        NSArray *section = sections[i];
        if (section.count > 0) {
            [titles addObject:sectionIndexTitles[i]];
        }
    }
    return titles;
}




@end
