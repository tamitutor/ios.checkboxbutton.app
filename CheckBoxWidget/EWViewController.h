//
//  EWViewController.h
//  CheckBoxWidget
//
//  Created by Tami Wright on 9/14/13.
//  Copyright (c) 2013 twright. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckBoxButton.h"
#define CheckBoxStatusLabelPrefix @"Checkbox ";
#define CheckBoxAllKey @"ALL";

@interface EWViewController : UIViewController <CheckBoxButtonDelegate>
@property (weak, nonatomic) IBOutlet UILabel *checkBoxStatusLabel;
@property (weak, nonatomic) IBOutlet CheckBoxButton *checkBoxAllButton;
@property (assign) NSString *checkBoxLabelString;
@property (weak, nonatomic) IBOutlet CheckBoxButton *checkBoxOneButton;
@property (weak, nonatomic) IBOutlet CheckBoxButton *checkBoxTwoButton;

@end
