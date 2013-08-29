//
//  SignUpViewController.h
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/28/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UITableViewController


@property (nonatomic, weak) IBOutlet UILabel *FirstName_Label;
@property (nonatomic, weak) IBOutlet UILabel *LastName_Label;
@property (nonatomic, weak) IBOutlet UILabel *UserName_Label;
@property (nonatomic, weak) IBOutlet UILabel *Email_Label;
@property (nonatomic, weak) IBOutlet UILabel *Password_Label;


@property (nonatomic, weak) IBOutlet UITextField *FirstName_TextField;
@property (nonatomic, weak) IBOutlet UITextField *LastName_TextField;
@property (nonatomic, weak) IBOutlet UITextField *UserName_TextField;
@property (nonatomic, weak) IBOutlet UITextField *Email_TextField;
@property (nonatomic, weak) IBOutlet UITextField *Password_TextField;


@property (nonatomic, weak) IBOutlet UIButton *SignUp_Button;


-(IBAction)cancel_onClick:(id)sender;
-(IBAction)signup_onClick:(id)sender;

@end
