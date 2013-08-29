//
//  MainViewController.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/26/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    UIViewController *rearVC = [storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];

    UIViewController* frontController = [storyboard instantiateViewControllerWithIdentifier:@"MasterViewController"];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:frontController];
  
    UIButton* menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 28, 20)];
    [menuButton setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    frontController.navigationItem.leftBarButtonItem = menuItem;
    
    self.contentViewController = nav;
    self.sidebarViewController = rearVC;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(menuitem_OnClick:)
                                                 name:@"menuitem_OnClick"
                                               object:nil];
    
   
}


- (void)revealToggle:(id)sender {
    //SidebarController1 *rearVC = (SidebarController1 *)self.sidebarViewController;
    [super toggleSidebar:!self.sidebarShowing duration:kGHRevealSidebarDefaultAnimationDuration];
}



-(void)menuitem_OnClick:(NSNotification *)notification{

    NSDictionary *SelectedItem = [notification object];
   
    [self revealToggle:nil];
    
   
    
    //////////////////////////////////////
    ////    Logout
    /////////////////////////////////////
    if ([[SelectedItem valueForKey:@"title"] isEqualToString:@"Logout"]) {
        [[NSNotificationQueue defaultQueue] enqueueNotification: [NSNotification notificationWithName: @"goto_AppStart" object: nil] postingStyle: NSPostASAP];
    }
    
    
    //////////////////////////////////////
    ////    Setup
    /////////////////////////////////////
     if ([[SelectedItem valueForKey:@"title"] isEqualToString:@"Setup"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"showSetup"];
        [[NSNotificationQueue defaultQueue] enqueueNotification: [NSNotification notificationWithName: @"goto_Login" object: nil] postingStyle: NSPostASAP];
    }
    
    
    
    //////////////////////////////////////
    ////    Notes
    /////////////////////////////////////
    if ([[SelectedItem valueForKey:@"title"] isEqualToString:@"Notes"]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        UIViewController *Controller = [storyboard instantiateViewControllerWithIdentifier:@"MasterViewController"];
        
        [self addMenuButtonToController:Controller];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Controller];
        self.contentViewController = nav;
    }
  
  
    //////////////////////////////////////
    ////    Profile
    /////////////////////////////////////
    if ([[SelectedItem valueForKey:@"title"] isEqualToString:@"Profile"]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Profile_iPhone" bundle:nil];
        UIViewController *Controller = [storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
  
        [self addMenuButtonToController:Controller];
        
        Controller.navigationItem.title = @"Profile";
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Controller];
        self.contentViewController = nav;
        
   
    }
    

    //////////////////////////////////////
    ////    Settings
    /////////////////////////////////////
    if ([[SelectedItem valueForKey:@"title"] isEqualToString:@"Settings"]) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"AppStart_iPhone" bundle:nil];
        UIViewController *Controller = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
        [self addMenuButtonToController:Controller];
    
        Controller.navigationItem.title = @"Settings";
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Controller];
        self.contentViewController = nav;
        
    }
    
    
    
    //////////////////////////////////////
    ////    About
    /////////////////////////////////////
    if ([[SelectedItem valueForKey:@"title"] isEqualToString:@"About"]) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"About_iPhone" bundle:nil];
        UIViewController *Controller = [storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
        [self addMenuButtonToController:Controller];
        
        Controller.navigationItem.title = @"About";
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Controller];
        self.contentViewController = nav;
        
    }
    
    
}

-(void)addMenuButtonToController:(UIViewController *)Controller{

    UIButton* menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 28, 20)];
    [menuButton setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    Controller.navigationItem.leftBarButtonItem = menuItem;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.title = self.contentViewController.title;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
