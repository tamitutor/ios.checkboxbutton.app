//
//  CheckBoxButton.m
//  CheckBoxWidget
//
//  Created by Tami Wright on 9/14/13.
//  Copyright (c) 2013 twright. All rights reserved.
//

#import "CheckBoxButton.h"

@implementation CheckBoxButton

- (void)baseInit {
    self.editable = NO;
    _delegate = nil;
}

- (BOOL)editable
{
    return _editable;
}

- (void)setEditable:(BOOL)editable
{
    self.checkBoxButton.enabled = editable;
    _editable = editable;
}

- (void)awakeFromNib
{
    [[NSBundle mainBundle] loadNibNamed:@"CheckBoxButton" owner:self options:nil];
    [self addSubview:self.checkBoxButton];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {        
        [self baseInit];    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)handleCheckBoxSelected {
    
    if (checkBoxSelected == 0){
        [self.checkBoxButton setSelected:YES];
        checkBoxSelected = 1;
    } else {
        [self.checkBoxButton setSelected:NO];
        checkBoxSelected = 0;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)checkBoxButton:(id)sender {
    if (!self.editable) return;
    
    [self handleCheckBoxSelected];
    [self.delegate checkBoxButton:self checkBoxButtonDidChange:checkBoxSelected];
}

@end
