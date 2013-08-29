//
//  LoginViewController.h
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/26/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>{

}

@property (nonatomic, weak) IBOutlet UITextField * usernameField;
@property (nonatomic, weak) IBOutlet UITextField * passwordField;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;
@property (nonatomic, weak) IBOutlet UIButton * forgotButton;
@property (nonatomic, weak) IBOutlet UILabel * titleLabel;
@property (nonatomic, weak) IBOutlet UIImageView * headerImageView;
@property (nonatomic, weak) IBOutlet UIView * infoView;
@property (nonatomic, weak) IBOutlet UILabel * infoLabel;
@property (nonatomic, weak) IBOutlet UIView * overlayView;



-(IBAction)Login_onClick:(id)sender;


@end
