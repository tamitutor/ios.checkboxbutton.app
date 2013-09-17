//
//  TableViewCellSummaryCell.h
//  CheckBoxWidget
//
//  Created by Tami Wright on 9/16/13.
//  Copyright (c) 2013 twright. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckBoxButton.h"

@interface TableViewSummaryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *resultsCountLabel;
//@property (weak, nonatomic) IBOutlet CheckBoxButton *checkBoxButton;
@property (weak, nonatomic) IBOutlet UILabel *searchTermLabel;
@property (weak, nonatomic) NSString *title;
@property (weak, nonatomic) IBOutlet CheckBoxButton *checkBoxButton;

@end
