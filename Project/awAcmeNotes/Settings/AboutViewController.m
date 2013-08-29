//
//  AboutViewController.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/28/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
	// Do any additional setup after loading the view.
    
    
    UIColor* mainColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
    UIColor* darkColor = [UIColor colorWithRed:10.0/255 green:78.0/255 blue:108.0/255 alpha:1.0f];
    
    UIColor* imageBorderColor = darkColor;
    
    NSString* fontName = @"Avenir-Book";
    NSString* boldItalicFontName = @"Avenir-BlackOblique";
    NSString* boldFontName = @"Avenir-Black";
    
    UIFont *titleLabelFont = [UIFont fontWithName:fontName size:12.0f];
    UIFont *valueLabelFont = [UIFont fontWithName:boldFontName size:14.0f];
    
    
    self.AppTitle.textColor =  mainColor;
    self.AppTitle.font =  [UIFont fontWithName:boldFontName size:18.0f];
    self.AppTitle.text = @"Acme Cloud Notes";
    
    self.AppSubtitle.textColor =  mainColor;
    self.AppSubtitle.font =  [UIFont fontWithName:boldItalicFontName size:14.0f];
    self.AppSubtitle.text = @"v 1.0";
    
    
    self.DeviceID_label.textColor =  mainColor;
    self.DeviceID_label.font =  titleLabelFont;
    self.DeviceID_label.text = @"Device ID";
    
    self.DeviceID_value.textColor =  mainColor;
    self.DeviceID_value.font =  valueLabelFont;
    self.DeviceID_value.text = @"123-1234-12345";
    
    
    self.ManagementID_label.textColor =  mainColor;
    self.ManagementID_label.font =  titleLabelFont;
    self.ManagementID_label.text = @"Management ID";
    
    self.ManagementID_value.textColor =  mainColor;
    self.ManagementID_value.font =  valueLabelFont;
    self.ManagementID_value.text = @"123-1234-12345-A2";
    
   
    self.ManagedBy_label.textColor =  mainColor;
    self.ManagedBy_label.font =  titleLabelFont;
    self.ManagedBy_label.text = @"Managed By";
    
    self.ManagedBy_value.textColor =  mainColor;
    self.ManagedBy_value.font =  valueLabelFont;
    self.ManagedBy_value.text = @"AirWatch";
    
   
    self.MDMURL_label.textColor =  mainColor;
    self.MDMURL_label.font =  titleLabelFont;
    self.MDMURL_label.text = @"MDM URL";
    
    self.MDMURL_value.textColor =  mainColor;
    self.MDMURL_value.font =  valueLabelFont;
    self.MDMURL_value.text = @"https://demo2.awmdm.com";
    
    self.AppImage.image = [UIImage imageNamed:@"Cloud"];
    self.AppImage.contentMode = UIViewContentModeScaleAspectFill;
    self.AppImage.clipsToBounds = YES;
    self.AppImage.layer.borderWidth = 4.0f;
    self.AppImage.layer.cornerRadius = 1.0f;
    self.AppImage.layer.borderColor = imageBorderColor.CGColor;
    
    
    [self addDividerToView:self.scrollView atLocation:230];
    //[self addDividerToView:self.scrollView atLocation:300];
    //[self addDividerToView:self.scrollView atLocation:370];
    
    self.scrollView.contentSize = CGSizeMake(320, 960);
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    
    
}


-(void)addDividerToView:(UIView*)view atLocation:(CGFloat)location{
    
    UIView* divider = [[UIView alloc] initWithFrame:CGRectMake(20, location, 280, 1)];
    divider.backgroundColor = [UIColor colorWithWhite:0.9f alpha:0.7f];
    [view addSubview:divider];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
