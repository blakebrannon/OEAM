//
//  MenuCell.h
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/26/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel* titleLabel;
@property (nonatomic, weak) IBOutlet UILabel* countLabel;
@property (nonatomic, weak) IBOutlet UIView* bgView;
@property (nonatomic, weak) IBOutlet UIView* topSeparator;
@property (nonatomic, weak) IBOutlet UIView* bottomSeparator;
@property (nonatomic, weak) IBOutlet UIImageView* iconImageView;
@property (nonatomic, strong) UIColor* mainColor;
@property (nonatomic, strong) UIColor* darkColor;


@end
