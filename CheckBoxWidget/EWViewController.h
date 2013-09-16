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
#define CheckBoxAllTag 0;

@interface EWViewController : UIViewController <CheckBoxButtonDelegate>
{
    NSArray *checkBoxButtonCollection;
}
@property (nonatomic, retain) IBOutletCollection(CheckBoxButton) NSArray *checkBoxButtonCollection;
@property (weak, nonatomic) IBOutlet UILabel *checkBoxStatusLabel;
@property (weak, nonatomic) IBOutlet CheckBoxButton *checkBoxAllButton;
@property (assign) NSString *checkBoxLabelString;

- (IBAction)checkBoxButtonAll:(id)sender;
- (IBAction)checkBoxButtons:(id)sender;

@end
