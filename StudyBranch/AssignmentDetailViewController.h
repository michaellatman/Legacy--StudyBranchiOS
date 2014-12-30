//
//  DetailViewController.h
//  StudyBranch
//
//  Created by Michael Latman on 12/21/14.
//  Copyright (c) 2014 Michael Latman. All rights reserved.
//

#import <XLForm/XLFormViewController.h>
#import <CoreData/CoreData.h>

@interface AssignmentDetailViewController : XLFormViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end

