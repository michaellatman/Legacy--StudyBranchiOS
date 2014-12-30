//
//  DetailViewController.h
//  StudyBranch
//
//  Created by Michael Latman on 12/21/14.
//  Copyright (c) 2014 Michael Latman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssignmentDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

