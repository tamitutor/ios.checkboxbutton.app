//
//  EWViewController.m
//  CheckBoxWidget
//
//  Created by Tami Wright on 9/14/13.
//  Copyright (c) 2013 twright. All rights reserved.
//

#import "MainViewController.h"
#import "SearchViewController.h"


@implementation MainViewController

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Search1"]) {
        SearchViewController *searchVC = segue.destinationViewController;
        searchVC.barTitle = [[NSString alloc] initWithFormat:@"Search 1"];
    }
    else if ([[segue identifier] isEqualToString:@"Search2"]) {
        SearchViewController *searchVC = segue.destinationViewController;
        searchVC.barTitle = [[NSString alloc] initWithFormat:@"Search 2"];
    }
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
    labelString = [labelString stringByAppendingString:((checkBoxButtonAllSelected == 1) ? @" is selected" : @" is not selected")];
    self.checkBoxStatusLabel.text = labelString;
}

@end
