//
//  MasterViewController.h
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/25/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController{

}

@property (strong, nonatomic) DetailViewController *detailViewController;

+(MasterViewController *)masterView;
-(void)reload;


@end
