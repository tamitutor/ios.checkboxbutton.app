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
	BOOL checkBoxSelected;
    BOOL _editable;
}
@property (strong, nonatomic) IBOutlet UIButton *checkBoxButton;
- (IBAction)checkBoxButton:(id)sender;
@property (assign) BOOL editable;
@property (assign) id <CheckBoxButtonDelegate> delegate;
@property (assign) NSString *key;

@end
