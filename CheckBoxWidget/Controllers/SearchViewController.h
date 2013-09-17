//
//  SearchViewController.h
//  CheckBoxWidget
//
//  Created by Tami Wright on 9/16/13.
//  Copyright (c) 2013 twright. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckBoxButton.h"

@interface SearchViewController : UITableViewController <CheckBoxButtonDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSMutableArray *searchResults;
@property (nonatomic, strong) NSMutableArray *imageSearchResults;
@property (nonatomic, strong) NSMutableArray *prepTimeSearchResults;
@property(nonatomic, strong) NSString *barTitle;

@end
