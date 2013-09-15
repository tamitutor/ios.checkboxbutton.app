//
//  EWViewController.m
//  CheckBoxWidget
//
//  Created by Tami Wright on 9/14/13.
//  Copyright (c) 2013 twright. All rights reserved.
//

#import "EWViewController.h"


@implementation EWViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.checkBoxAllButton.delegate = self;
    self.checkBoxAllButton.editable = YES;
#warning Use tags instead of "key" for buttons
#warning Add buttons to array
    self.checkBoxAllButton.key = CheckBoxAllKey;
    self.checkBoxOneButton.delegate = self;
    self.checkBoxOneButton.editable = YES;
    self.checkBoxOneButton.key = @"ONE";
    self.checkBoxTwoButton.delegate = self;
    self.checkBoxTwoButton.editable = YES;
    self.checkBoxTwoButton.key = @"TWO";
    self.checkBoxLabelString = CheckBoxStatusLabelPrefix;
    self.checkBoxStatusLabel.text = [self.checkBoxLabelString stringByAppendingString:@"not selected"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkBoxButton:(CheckBoxButton *)checkBoxButton checkBoxButtonDidChange:(BOOL)checkBoxSelected
{
    NSString *labelString = CheckBoxStatusLabelPrefix;
    labelString = [labelString stringByAppendingString:[checkBoxButton.key stringByAppendingString:((checkBoxSelected == 1) ? @" is selected" : @" is not selected")]];
    self.checkBoxStatusLabel.text = labelString;
    
    NSString *allKey = CheckBoxAllKey;
    if ([checkBoxButton.key isEqualToString:allKey])
    {
        [self.checkBoxOneButton setCheckBoxSelection:checkBoxSelected];
    
        [self.checkBoxTwoButton setCheckBoxSelection:checkBoxSelected];
    }
    else
    {
        if (!checkBoxSelected)
            [self.checkBoxAllButton setCheckBoxSelection:checkBoxSelected];
        else
        {
            
        }
        
    }
}

@end
