//
//  SettingsViewController.h
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/28/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UITableViewController


-(IBAction)finish_onClick:(id)sender;


@property (nonatomic, weak) IBOutlet UITableViewCell *RequirePasscode;
@property (nonatomic, weak) IBOutlet UITableViewCell *CloudServices;
@property (nonatomic, weak) IBOutlet UITableViewCell *CellularData;
@property (nonatomic, weak) IBOutlet UISwitch *AllowTextCopy;
@property (nonatomic, weak) IBOutlet UITableViewCell *Logging;


-(IBAction)AllowTextCopy_onChange:(id)sender;


@end
