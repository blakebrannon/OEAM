//
//  AppDelegate.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/25/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "AppDelegate.h"
#import "Notes.h"
#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    


    
    
    // Override point for customization after application launch.
    [[NSNotificationCenter defaultCenter] addObserver:[Notes class]
                                             selector:@selector(dataUpdatedFromCloud:)
                                                 name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification
                                               object:[NSUbiquitousKeyValueStore defaultStore]];
    
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"GoogleDrive"];
    
    [[NSUbiquitousKeyValueStore defaultStore] synchronize];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(login_Success:)
                                                 name:@"login_Success"
                                               object:nil];
 
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(goto_Login:)
                                                 name:@"goto_Login"
                                               object:nil];

    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(goto_AppStart:)
                                                 name:@"goto_AppStart"
                                               object:nil];
    
    
    
    [self goto_AppStart:nil];
    
    
    return YES;
}






							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




-(void)goto_AppStart:(NSNotification *)notification{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"AppStart_iPhone" bundle:nil];
    UIViewController* initialViewController = [storyboard instantiateViewControllerWithIdentifier:@"SetupNavController"];
    
    self.window.rootViewController  = initialViewController;
    [self.window makeKeyAndVisible];
    
}


-(void)goto_Login:(NSNotification *)notification{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Login_iPhone" bundle:nil];
    UIViewController* initialViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginNavController"];
    
    self.window.rootViewController  = initialViewController;
    [self.window makeKeyAndVisible];
    
}



-(void)login_Success:(NSNotification *)notification{

    UIViewController* initialViewController =  [[MainViewController alloc] init];
    self.window.rootViewController  = initialViewController;
    [self.window makeKeyAndVisible];
    
}





@end
