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
    self.checkBoxButton.delegate = self;
    self.checkBoxButton.editable = YES;
    self.checkBoxButton.key = @"all";
    self.checkBoxLabelString = checkBoxStatusLabelPrefix;
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
    NSString *labelString = checkBoxStatusLabelPrefix;
    labelString = [labelString stringByAppendingString:((checkBoxSelected == 1) ? @"selected" : @"not selected")];
    self.checkBoxStatusLabel.text = labelString;
}

@end
