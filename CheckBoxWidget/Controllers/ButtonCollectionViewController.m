//
//  ButtonCollectionViewController.m
//  CheckBoxWidget
//
//  Created by Tami Wright on 9/17/13.
//  Copyright (c) 2013 twright. All rights reserved.
//

#import "ButtonCollectionViewController.h"

@interface ButtonCollectionViewController ()

@end

@implementation ButtonCollectionViewController

@synthesize checkBoxButtonCollection;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.checkBoxAllButton.delegate = self;
    self.checkBoxAllButton.editable = YES;
    int counter = 1;
    for (CheckBoxButton *checkBoxButton in checkBoxButtonCollection) {
        checkBoxButton.delegate = self;
        checkBoxButton.editable = YES;
        checkBoxButton.tag = counter;
        counter++;
    }
    
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
    
    BOOL checkBoxButtonAllSelected = self.checkBoxAllButton.checkBoxSelected;
    if ( checkBoxButton.tag == self.checkBoxAllButton.tag )
    {
        /**
         NSNumber *result = [NSNumber numberWithBool:self.checkBoxAllButton.selected];
         [checkBoxButtonCollection setValue: result forKey: @"selected"];
         **/
        for (CheckBoxButton *button in checkBoxButtonCollection) {
            [button setCheckBoxSelection:
             checkBoxButtonAllSelected];
        }
        
    }
    else
    {
        for (CheckBoxButton *button in checkBoxButtonCollection) {
            if (!button.checkBoxSelected) {
                checkBoxButtonAllSelected = button.checkBoxSelected;
                break;
            }
            checkBoxButtonAllSelected = YES;
        }
        [self.checkBoxAllButton setCheckBoxSelection:checkBoxButtonAllSelected];
        
    }
    
    NSString *labelString = CheckBoxStatusLabelPrefix;
    labelString = [labelString stringByAppendingString:((checkBoxButtonAllSelected == 1) ? @"is selected" : @"not selected")];
    self.checkBoxStatusLabel.text = labelString;
}

@end
