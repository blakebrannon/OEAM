//
//  MenuViewController.h
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/26/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView* tableView;
@property (nonatomic, weak) IBOutlet UILabel* AppTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel* AppSubtitleLabel;
@property (nonatomic, weak) IBOutlet UIImageView* AppLogo;

@property (nonatomic, weak) id delegate;


@end
