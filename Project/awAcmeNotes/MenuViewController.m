//
//  MenuViewController.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/26/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuCell.h"

@interface MenuViewController ()
@property (nonatomic, strong) NSArray* items;
@end

@implementation MenuViewController

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
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UIColor* mainColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
    UIColor* darkColor = [UIColor colorWithRed:10.0/255 green:78.0/255 blue:108.0/255 alpha:1.0f];
    
    self.view.backgroundColor = darkColor;
    self.tableView.backgroundColor = darkColor;
    self.tableView.separatorColor = [UIColor clearColor];
    
    NSString* fontName = @"Avenir-Black";
    NSString* boldFontName = @"Avenir-BlackOblique";
    
    self.AppTitleLabel.textColor = [UIColor whiteColor];
    self.AppTitleLabel.font = [UIFont fontWithName:fontName size:14.0f];
    self.AppTitleLabel.text = @"Bill DeWeese";
    
    self.AppSubtitleLabel.textColor = mainColor;
    self.AppSubtitleLabel.font = [UIFont fontWithName:boldFontName size:10.0f];
    self.AppSubtitleLabel.text = @"billdeweese@air-watch.com";
    
    self.AppLogo.image = [UIImage imageNamed:@"userProfile.png"];
    self.AppLogo.clipsToBounds = YES;
    //self.AppLogo.layer.borderWidth = 2.0; //4.0f;
    //self.AppLogo.layer.borderColor = darkColor.CGColor; //[UIColor colorWithWhite:1.0f alpha:0.5f].CGColor;
    //self.AppLogo.layer.cornerRadius = 30.0f;
    
    
    NSDictionary* object2 = [NSDictionary dictionaryWithObjects:@[ @"Notes", @"7", @"check" ] forKeys:@[ @"title", @"count", @"icon" ]];
    NSDictionary* object3 = [NSDictionary dictionaryWithObjects:@[ @"Profile", @"0", @"icon-contacts" ] forKeys:@[ @"title", @"count", @"icon" ]];
    NSDictionary* object4 = [NSDictionary dictionaryWithObjects:@[ @"Settings", @"0", @"settings" ] forKeys:@[ @"title", @"count", @"icon" ]];
    NSDictionary* object1 = [NSDictionary dictionaryWithObjects:@[ @"About", @"0", @"infoButton" ] forKeys:@[ @"title", @"count", @"icon" ]];
    NSDictionary* object5 = [NSDictionary dictionaryWithObjects:@[ @"Logout", @"0", @"arrow" ] forKeys:@[ @"title", @"count", @"icon" ]];
    
    self.items = @[object2,object3, object4, object1,  object5];
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MenuCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
    
    NSDictionary* item = self.items[indexPath.row];
    
    cell.titleLabel.text = item[@"title"];
    cell.iconImageView.image = [UIImage imageNamed:item[@"icon"]];
    
    NSString* count = item[@"count"];
    if(![count isEqualToString:@"0"]){
        cell.countLabel.text = count;
    }
    else{
        cell.countLabel.alpha = 0;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected row %i" , indexPath.row);
    NSDictionary *selectedItem = [self.items objectAtIndex:indexPath.row];
    [[NSNotificationQueue defaultQueue] enqueueNotification: [NSNotification notificationWithName: @"menuitem_OnClick" object: selectedItem] postingStyle: NSPostNow];
   
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 46;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
