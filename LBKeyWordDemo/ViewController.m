//
//  ViewController.m
//  LBKeyWordDemo
//
//  Created by zlb on 2018/10/24.
//  Copyright © 2018 zlb. All rights reserved.
//

#import "ViewController.h"
#import "LBKeyWordLayout.h"
#import "KeyWordCell.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) LBKeyWordLayout *layout;
@property (strong, nonatomic) NSArray *items;
@end

@implementation ViewController

- (void)generateItems
{
    NSNumberFormatter *nf = [NSNumberFormatter new];
    nf.numberStyle = NSNumberFormatterSpellOutStyle;
    NSMutableArray *array = [NSMutableArray array];
    const NSInteger count = 10;
    for (NSInteger i = 0; i < count; ++i) {
        [array addObject:[NSString stringWithFormat:@"%@", [nf stringFromNumber:@(i)]]];
    }
    self.items = array.copy;
//    [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSMutableArray *array = [self.items mutableCopy];
//        [array addObject: [nf stringFromNumber:@(arc4random_uniform(100))]];
//        self.items = [array copy];
//        [self.collectionView reloadData];
//    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self generateItems];
    self.layout = [[LBKeyWordLayout alloc] init];
    self.layout.estimatedItemSize = CGSizeMake(80, 30);
    self.layout.sectionInset = UIEdgeInsetsMake(10, 0,10, 0);
    self.layout.headerReferenceSize = CGSizeMake(300, 30);
    self.collectionView.collectionViewLayout = self.layout;
    // Do any additional setup after loading the view, typically from a nib.
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSMutableArray *array = [self.items mutableCopy];
    [array addObject:textField.text.length?textField.text:@"hot word"];
    self.items = [array copy];
    [self.collectionView reloadData];
    return YES;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        return [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    }
    return nil;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KeyWordCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"KeyWordCell" forIndexPath:indexPath];
    cell.maxWidthConstraint.constant = CGRectGetWidth(collectionView.bounds) - self.layout.sectionInset.left - self.layout.sectionInset.right - cell.layoutMargins.left - cell.layoutMargins.right - 10;
    cell.textLabel.numberOfLines = 1;
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}

@end
