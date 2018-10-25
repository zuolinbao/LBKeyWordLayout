//
//  KeyWordCell.h
//  LBKeyWordDemo
//
//  Created by zlb on 2018/10/24.
//  Copyright © 2018 zlb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyWordCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *maxWidthConstraint;

@end
