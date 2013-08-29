//
//  AboutViewController.h
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/28/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController


@property (nonatomic, weak) IBOutlet UIImageView* AppImage;
@property (nonatomic, weak) IBOutlet UIView* overlayView;

@property (nonatomic, weak) IBOutlet UILabel* AppTitle;
@property (nonatomic, weak) IBOutlet UILabel* AppSubtitle;

@property (nonatomic, weak) IBOutlet UILabel* DeviceID_label;
@property (nonatomic, weak) IBOutlet UILabel* ManagementID_label;
@property (nonatomic, weak) IBOutlet UILabel* ManagedBy_label;
@property (nonatomic, weak) IBOutlet UILabel* MDMURL_label;

@property (nonatomic, weak) IBOutlet UILabel* DeviceID_value;
@property (nonatomic, weak) IBOutlet UILabel* ManagementID_value;
@property (nonatomic, weak) IBOutlet UILabel* ManagedBy_value;
@property (nonatomic, weak) IBOutlet UILabel* MDMURL_value;

@property (nonatomic, weak) IBOutlet UIScrollView* scrollView;



@end
