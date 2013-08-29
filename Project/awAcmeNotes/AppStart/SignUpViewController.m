//
//  SignUpViewController.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/28/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)cancel_onClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
};


-(IBAction)signup_onClick:(id)sender{
    
     [self performSegueWithIdentifier:@"ShowSettings" sender:self];
    
    //ShowSettings
    
    
    //[self ShowAlert_MDMRequired];
    
};



-(void)ShowAlert_MDMRequired{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Access Denied."
                                                    message:@"Company XYZ requires this app to be managed by the company BYOD program. Click to auto enroll."
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Enroll", nil];
    [alert show];
    
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.air-watch.com"]];
    }else{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}




@end
