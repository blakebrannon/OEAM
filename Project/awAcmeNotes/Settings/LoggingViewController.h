//
//  LoggingViewController.h
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/28/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoggingViewController : UITableViewController

@property (nonatomic, weak) IBOutlet UITableViewCell *None;
@property (nonatomic, weak) IBOutlet UITableViewCell *General;
@property (nonatomic, weak) IBOutlet UITableViewCell *Error;
@property (nonatomic, weak) IBOutlet UITableViewCell *Warning;
@property (nonatomic, weak) IBOutlet UITableViewCell *Information;
@property (nonatomic, weak) IBOutlet UITableViewCell *Verbose;




@end
