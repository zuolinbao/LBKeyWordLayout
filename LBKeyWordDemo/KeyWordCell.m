//
//  KeyWordCell.m
//  LBKeyWordDemo
//
//  Created by zlb on 2018/10/24.
//  Copyright © 2018 zlb. All rights reserved.
//

#import "KeyWordCell.h"

@implementation KeyWordCell
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = 2.0f;
    self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.cornerRadius = CGRectGetMidY(self.bounds);
}
@end
