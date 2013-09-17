//
//  TableViewCellResult.h
//  CheckBoxWidget
//
//  Created by Tami Wright on 9/16/13.
//  Copyright (c) 2013 twright. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckBoxButton.h"

@interface TableViewResultCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbNailImageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *preparationTimeValueLabel;
@property (weak, nonatomic) IBOutlet CheckBoxButton *checkBoxButton;
@property (weak, nonatomic) NSString *title;

@end
