//
//  DetailViewController.m
//  StudyBranch
//
//  Created by Michael Latman on 12/21/14.
//  Copyright (c) 2014 Michael Latman. All rights reserved.
//

#import "AssignmentDetailViewController.h"

#import "XLForm.h"

@interface AssignmentDetailViewController ()

@end

@implementation AssignmentDetailViewController

#pragma mark - Managing the detail item

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        [self initForm];
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self initForm];
    }
    return self;
}
-(void) setDetailItem:(id)detailItem{
    _detailItem = detailItem;
    self.navigationController.title = @"Assignment";
    [self initForm];
    
}
- (void)initForm
{
    
    //self = [super init];
    if (self){
        XLFormDescriptor * form;
        XLFormSectionDescriptor * section;
        XLFormRowDescriptor * row;
    
        if(!_detailItem)form = [XLFormDescriptor formDescriptorWithTitle:@"Create Assignment"];
        else form = [XLFormDescriptor formDescriptorWithTitle:@"Assignment"];
  
        section = [XLFormSectionDescriptor formSectionWithTitle:@"General"];
        [form addFormSection:section];
        
        // Title
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"title" rowType:XLFormRowDescriptorTypeText title:@"Title"];
       
        if(_detailItem)[row.cellConfig setObject:[[_detailItem valueForKey:@"name"] description] forKey:@"textField.text"];
        [section addFormRow:row];

        
        section = [XLFormSectionDescriptor formSection];
        [form addFormSection:section];
        
        /*// All-day
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"all-day" rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"All-day"];
        [section addFormRow:row];*/
        
        // Due Date
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"dueDate" rowType:XLFormRowDescriptorTypeDateTimeInline title:@"Due Date"];
        row.value = [NSDate dateWithTimeIntervalSinceNow:60*60*24];
        [section addFormRow:row];
        
        
             /*
        // Repeat
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"repeat" rowType:XLFormRowDescriptorTypeSelectorPush title:@"Repeat"];
        row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"];
        row.selectorTitle = @"Repeat";
        row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"],
                                [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Every Day"],
                                [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Every Week"],
                                [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Every 2 Weeks"],
                                [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Every Month"],
                                [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"Every Year"],
                                ];
         
        [section addFormRow:row];
         */
        
        
        
        // Alert
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"alert" rowType:XLFormRowDescriptorTypeSelectorPush title:@"Alert"];
        row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"None"];
        row.selectorTitle = @"Event Alert";
        row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"None"],
                                [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"At time of event"],
                                [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"5 minutes before"],
                                [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"15 minutes before"],
                                [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"30 minutes before"],
                                [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"1 hour before"],
                                [XLFormOptionsObject formOptionsObjectWithValue:@(6) displayText:@"2 hours before"],
                                [XLFormOptionsObject formOptionsObjectWithValue:@(7) displayText:@"1 day before"],
                                [XLFormOptionsObject formOptionsObjectWithValue:@(8) displayText:@"2 days before"],
                                ];
        [section addFormRow:row];
        
        
        section = [XLFormSectionDescriptor formSection];
        [form addFormSection:section];
        
        // Show As
        /*row = [XLFormRowDescriptor formRowDescriptorWithTag:@"showAs" rowType:XLFormRowDescriptorTypeSelectorPush title:@"Show As"];
        row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Busy"];
        row.selectorTitle = @"Show As";
        row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Busy"],
                                [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Free"]];
        [section addFormRow:row];*/
       
        
        // URL
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"url" rowType:XLFormRowDescriptorTypeURL];
        [row.cellConfigAtConfigure setObject:@"URL" forKey:@"textField.placeholder"];
        [section addFormRow:row];
        
        // Location
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"notes" rowType:XLFormRowDescriptorTypeTextView];
        [row.cellConfigAtConfigure setObject:@"Notes" forKey:@"textView.placeholder"];
        [section addFormRow:row];
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"delete" rowType:XLFormRowDescriptorTypeButton title:@"Delete"];
        
        
        [section addFormRow:row];
        self.form = form;
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelPressed:)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(savePressed:)];
        
        
        //self.showDeleteButton = YES;
    }
 //   return self;
}


#pragma mark - XLFormDescriptorDelegate

-(void) didSelectFormRow:(XLFormRowDescriptor *)formRow{
       [super didSelectFormRow:formRow];
    if([formRow.tag  isEqual: @"delete"] ){
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel"           destructiveButtonTitle:@"Delete Assignment" otherButtonTitles:nil];
        
        [actionSheet showInView:self.view];
          //[self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)formRowDescriptorValueHasChanged:(XLFormRowDescriptor *)rowDescriptor oldValue:(id)oldValue newValue:(id)newValue
{
    [super formRowDescriptorValueHasChanged:rowDescriptor oldValue:oldValue newValue:newValue];
    if ([rowDescriptor.tag isEqualToString:@"alert"]){
        if ([[rowDescriptor.value valueData] isEqualToNumber:@(0)] == NO && [[oldValue valueData] isEqualToNumber:@(0)]){
            
            XLFormRowDescriptor * newRow = [rowDescriptor copy];
            [newRow setTag:@"secondAlert"];
            newRow.title = @"Second Alert";
            [self.form addFormRow:newRow afterRow:rowDescriptor];
        }
        else if ([[oldValue valueData] isEqualToNumber:@(0)] == NO && [[newValue valueData] isEqualToNumber:@(0)]){
            [self.form removeFormRowWithTag:@"secondAlert"];
        }
    }
    else if ([rowDescriptor.tag isEqualToString:@"all-day"]){
        XLFormDateCell * dateStartCell = (XLFormDateCell *)[[self.form formRowWithTag:@"starts"] cellForFormController:self];
        XLFormDateCell * dateEndCell = (XLFormDateCell *)[[self.form formRowWithTag:@"ends"] cellForFormController:self];
        NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
        if ([[rowDescriptor.value valueData] boolValue] == YES){
            [dateFormatter setDateStyle:NSDateFormatterFullStyle];
            [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
            [dateStartCell setFormDatePickerMode:XLFormDateDatePickerModeDate];
            [dateEndCell setFormDatePickerMode:XLFormDateDatePickerModeDate];
        }
        else{
            [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
            [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
            [dateStartCell setFormDatePickerMode:XLFormDateDatePickerModeDateTime];
            [dateEndCell setFormDatePickerMode:XLFormDateDatePickerModeDateTime];
        }
        dateStartCell.dateFormatter = dateFormatter;
        dateEndCell.dateFormatter = dateFormatter;
        [dateStartCell update];
        [dateEndCell update];
    }
    else if ([rowDescriptor.tag isEqualToString:@"starts"]){
        XLFormRowDescriptor * startDateDescriptor = [self.form formRowWithTag:@"starts"];
        XLFormRowDescriptor * endDateDescriptor = [self.form formRowWithTag:@"ends"];
        XLFormDateCell * dateEndCell = (XLFormDateCell *)[endDateDescriptor cellForFormController:self];
        if ([startDateDescriptor.value compare:endDateDescriptor.value] == NSOrderedDescending) {
            // startDateDescriptor is later than endDateDescriptor
            endDateDescriptor.value =  [[NSDate alloc] initWithTimeInterval:(60*60*24) sinceDate:startDateDescriptor.value];
            [dateEndCell update];
        }
    }
    else if ([rowDescriptor.tag isEqualToString:@"ends"]){
        XLFormRowDescriptor * startDateDescriptor = [self.form formRowWithTag:@"starts"];
        XLFormRowDescriptor * endDateDescriptor = [self.form formRowWithTag:@"ends"];
        XLFormDateCell * dateEndCell = (XLFormDateCell *)[endDateDescriptor cellForFormController:self];
        if ([startDateDescriptor.value compare:endDateDescriptor.value] == NSOrderedDescending) {
            // startDateDescriptor is later than endDateDescriptor
            NSDictionary *strikeThroughAttribute = [NSDictionary dictionaryWithObject:@1
                                                                               forKey:NSStrikethroughStyleAttributeName];
            NSAttributedString* strikeThroughText = [[NSAttributedString alloc] initWithString:dateEndCell.detailTextLabel.text attributes:strikeThroughAttribute];
            dateEndCell.detailTextLabel.attributedText = strikeThroughText;
        }
    }
}

-(IBAction)cancelPressed:(UIBarButtonItem * __unused)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction)savePressed:(UIBarButtonItem * __unused)button
{
    NSArray * validationErrors = [self formValidationErrors];
    if (validationErrors.count > 0){
        [self showFormValidationError:[validationErrors firstObject]];
        return;
    }
    [self.tableView endEditing:YES];
    NSDictionary *values = [self.form formValues];
    if(!_detailItem){
        _detailItem =    [NSEntityDescription insertNewObjectForEntityForName:@"Assignment" inManagedObjectContext:_managedObjectContext];
    }
    [_detailItem setValue:[values valueForKey:@"title"] forKey:@"name"];
    NSError *error;
    [_managedObjectContext save:&error];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

