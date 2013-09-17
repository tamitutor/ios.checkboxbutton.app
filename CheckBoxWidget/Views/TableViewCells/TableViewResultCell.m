//
//  TableViewCellResult.m
//  CheckBoxWidget
//
//  Created by Tami Wright on 9/16/13.
//  Copyright (c) 2013 twright. All rights reserved.
//

#import "TableViewResultCell.h"

@implementation TableViewResultCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
