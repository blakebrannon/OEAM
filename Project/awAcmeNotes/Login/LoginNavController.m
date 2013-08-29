//
//  LoginNavController.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/26/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "LoginNavController.h"
#import "LoginViewController.h"
#import "AskForServerViewController.h"


@interface LoginNavController ()

@end

@implementation LoginNavController

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
    
    
    BOOL showSetup = [[NSUserDefaults standardUserDefaults] boolForKey:@"showSetup"];
    if (showSetup == YES) {
        return;
    }
    
    NSString *serverAddr =[[NSUserDefaults standardUserDefaults] valueForKey:@"ServerAddr"];
    
    if (serverAddr) {
   
        if (serverAddr.length > 0) {
            
            
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Login_iPhone" bundle:nil];
            
           // AskForServerViewController *controller = [sb instantiateViewControllerWithIdentifier:@"AskForServerViewController"];
            //[self pushViewController:controller animated:NO];
            
            LoginViewController *controller2 = [sb instantiateViewControllerWithIdentifier:@"LoginViewController"];
            [self pushViewController:controller2 animated:NO];
            
        }
        
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}


- (BOOL)shouldAutorotate
{
    return YES;
}



@end
