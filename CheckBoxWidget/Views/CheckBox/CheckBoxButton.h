//
//  CheckBoxButton.h
//  CheckBoxWidget
//
//  Created by Tami Wright on 9/14/13.
//  Copyright (c) 2013 twright. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CheckBoxButton;

@protocol CheckBoxButtonDelegate
- (void)checkBoxButton:(CheckBoxButton *)checkBoxButton checkBoxButtonDidChange:(BOOL)checkBoxSelected;
@end

@interface CheckBoxButton : UIButton
{
	BOOL _checkBoxSelected;
    BOOL _editable;
}
@property (strong, nonatomic) IBOutlet UIButton *checkBoxButton;
@property (assign) BOOL editable;
@property (readonly,nonatomic) BOOL checkBoxSelected;
@property (assign) id <CheckBoxButtonDelegate> delegate;- (IBAction)checkBoxButton:(id)sender;
- (void)setCheckBoxSelection:(BOOL)selected;

@end
