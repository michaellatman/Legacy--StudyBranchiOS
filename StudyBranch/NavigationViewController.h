//
//  NavigationViewController.h
//  StudyBranch
//
//  Created by Michael Latman on 12/30/14.
//  Copyright (c) 2014 Michael Latman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RESideMenu.h>

@interface NavigationViewController : UIViewController <UITableViewDataSource,  UITableViewDelegate, RESideMenuDelegate>
    @property (strong, readwrite, nonatomic) UITableView *tableView;
@end
