//
//  LoggingViewController.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/28/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "LoggingViewController.h"

@interface LoggingViewController ()
@property (nonatomic, strong) IBOutlet NSArray *items;
@end

@implementation LoggingViewController

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
    
    self.items = [NSArray arrayWithObjects:
                  self.None,
                  self.General,
                  self.Error,
                  self.Warning,
                  self.Information,
                  self.Verbose, nil];
    
    
    for (UITableViewCell *c in self.items) {
        [c setAccessoryType:UITableViewCellAccessoryNone];
    }

    int selectedLogLevel = [[[NSUserDefaults standardUserDefaults] valueForKey:@"LogLevel"] integerValue];
    [[self.items objectAtIndex:selectedLogLevel] setAccessoryType:UITableViewCellAccessoryCheckmark];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    for (UITableViewCell *c in self.items) {
        [c setAccessoryType:UITableViewCellAccessoryNone];
    }
 
    [[self.items objectAtIndex:indexPath.row] setAccessoryType:UITableViewCellAccessoryCheckmark];

    [[NSUserDefaults standardUserDefaults] setInteger:indexPath.row forKey:@"LogLevel"];
     
};


@end
