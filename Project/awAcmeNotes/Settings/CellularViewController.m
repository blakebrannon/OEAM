//
//  CellularViewController.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/28/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "CellularViewController.h"

@interface CellularViewController ()

@end

@implementation CellularViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    ////////////////////////////////////
    ///  AllowCellData
    ////////////////////////////////////
    // Set some defaults.
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"AllowCellData"] == nil) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"AllowCellData"];
    }
    BOOL savedValue_AllowCellData = [[NSUserDefaults standardUserDefaults] boolForKey:@"AllowCellData"];
    if (savedValue_AllowCellData == 0) {
        self.AllowCellData.on = NO;
    }else{
        self.AllowCellData.on = YES;
    }
    
    
    ////////////////////////////////////
    ///  AllowDataRoaming
    ////////////////////////////////////
    // Set some defaults.
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"AllowDataRoaming"] == nil) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"AllowDataRoaming"];
    }
    BOOL savedValue_AllowDataRoaming = [[NSUserDefaults standardUserDefaults] boolForKey:@"AllowDataRoaming"];
    if (savedValue_AllowDataRoaming == 0) {
        self.AllowDataRoaming.on = NO;
    }else{
        self.AllowDataRoaming.on = YES;
    }
    
    
    if (self.AllowCellData.on == NO) {
        self.AllowDataRoaming.on = NO;
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)AllowCellData_onChange:(id)sender{

    [[NSUserDefaults standardUserDefaults] setBool:self.AllowCellData.on forKey:@"AllowCellData"];
   
    if (self.AllowCellData.on == NO) {
        self.AllowDataRoaming.on = NO;
        [[NSUserDefaults standardUserDefaults] setBool:self.AllowDataRoaming.on forKey:@"AllowDataRoaming"];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
   

};

-(IBAction)AllowDataRoaming_onChange:(id)sender{

    if (self.AllowCellData.on == NO) {
        self.AllowDataRoaming.on = NO;
    }
        
    [[NSUserDefaults standardUserDefaults] setBool:self.AllowDataRoaming.on forKey:@"AllowDataRoaming"];
    [[NSUserDefaults standardUserDefaults] synchronize];

};



@end
