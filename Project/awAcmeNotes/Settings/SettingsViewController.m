//
//  SettingsViewController.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/28/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated{
 
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    [self.navigationItem setHidesBackButton:YES];
  
    // Only show the finish button if I am in the setup wizard.
    if ([[self.navigationController.viewControllers objectAtIndex:0 ] isEqual:self]) {
        self.navigationItem.rightBarButtonItem = nil;
    }
    
    ////////////////////////////////////
    ///  LogLevel
    ////////////////////////////////////
    int savedValue_LogLevel = [[[NSUserDefaults standardUserDefaults] valueForKey:@"LogLevel"] integerValue];
    if (savedValue_LogLevel == 0) {
        [self.Logging.detailTextLabel setText:@"Off"];
    }else{
        [self.Logging.detailTextLabel setText:@"On"];
    }
    
    
    ////////////////////////////////////
    ///  Allow Text Copy
    ////////////////////////////////////
    // Set some defaults.
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"AllowTextCopy"] == nil) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"AllowTextCopy"];
    }
    BOOL savedValue_AllowTextCopy = [[NSUserDefaults standardUserDefaults] boolForKey:@"AllowTextCopy"];
    if (savedValue_AllowTextCopy == 0) {
        self.AllowTextCopy.on = NO;
    }else{
         self.AllowTextCopy.on = YES;
    }
    
    
    ////////////////////////////////////
    ///  AllowCellData
    ////////////////////////////////////
    // Set some defaults.
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"AllowCellData"] == nil) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"AllowCellData"];
    }
    BOOL savedValue_AllowCellData = [[NSUserDefaults standardUserDefaults] boolForKey:@"AllowCellData"];
    if (savedValue_AllowCellData == NO) {
       [self.CellularData.detailTextLabel setText:@"Off"];
    }else{
       [self.CellularData.detailTextLabel setText:@"On"];
    }
    
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)finish_onClick:(id)sender{
    [[NSNotificationQueue defaultQueue] enqueueNotification: [NSNotification notificationWithName: @"login_Success" object: nil] postingStyle: NSPostNow];
};


-(IBAction)AllowTextCopy_onChange:(id)sender{

    [[NSUserDefaults standardUserDefaults] setBool:self.AllowTextCopy.on forKey:@"AllowTextCopy"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
