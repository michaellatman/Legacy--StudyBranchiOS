//
//  MasterViewController.h
//  StudyBranch
//
//  Created by Michael Latman on 12/21/14.
//  Copyright (c) 2014 Michael Latman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AssignmentViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
- (IBAction)insertObject:(id)sender;


@end

