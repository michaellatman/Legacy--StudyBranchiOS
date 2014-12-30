//
//  RootViewController.m
//  StudyBranch
//
//  Created by Michael Latman on 12/21/14.
//  Copyright (c) 2014 Michael Latman. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)awakeFromNib
{
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"assignmentsViewController"];
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"menuViewController"];
    self.delegate = self;
    //self.rightMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"rightMenuController"];
}
- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController{
    [self setMenuOpen:NO];
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void) sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController{
    [self setMenuOpen:YES];
    [self setNeedsStatusBarAppearanceUpdate];
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    if(self.menuOpen) return UIStatusBarStyleLightContent;
    else return UIStatusBarStyleDefault;
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
