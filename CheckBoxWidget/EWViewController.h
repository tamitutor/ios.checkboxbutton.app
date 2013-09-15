//
//  EWViewController.h
//  CheckBoxWidget
//
//  Created by Tami Wright on 9/14/13.
//  Copyright (c) 2013 twright. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckBoxButton.h"
#define checkBoxStatusLabelPrefix @"Checkbox is ";

@interface EWViewController : UIViewController <CheckBoxButtonDelegate>
@property (weak, nonatomic) IBOutlet UILabel *checkBoxStatusLabel;
@property (weak, nonatomic) IBOutlet CheckBoxButton *checkBoxButton;
@property (assign) NSString *checkBoxLabelString;

@end
