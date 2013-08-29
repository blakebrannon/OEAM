//
//  WelcomeViewController.h
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/28/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeViewController : UIViewController


@property (nonatomic, weak) IBOutlet UIImageView* AppImage;

@property (nonatomic, weak) IBOutlet UILabel *WelcomeTitle;
@property (nonatomic, weak) IBOutlet UILabel *WelcomeSubtitle;

@property (nonatomic, weak) IBOutlet UIButton *SignUp;
@property (nonatomic, weak) IBOutlet UIButton *SingIn;



@end
