//
//  CellularViewController.h
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/28/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellularViewController : UITableViewController



@property (nonatomic, weak) IBOutlet UISwitch *AllowCellData;
@property (nonatomic, weak) IBOutlet UISwitch *AllowDataRoaming;


-(IBAction)AllowCellData_onChange:(id)sender;
-(IBAction)AllowDataRoaming_onChange:(id)sender;


@end
