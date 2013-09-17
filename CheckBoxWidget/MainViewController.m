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

- (void)viewDidLoad
{
    
    [super viewDidLoad];
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


@end
