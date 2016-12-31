//
//  SHLoopView.m
//  无限轮播器
//
//  Created by macbook pro on 16/10/20.
//  Copyright © 2016年 itcsas. All rights reserved.
//

#import "SHLoopView.h"
#import "SHLoopCell.h"
#import "SHLoopFlowLayout.h"

@interface SHLoopView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, copy) void (^selectedCallBack)(NSInteger index);
@end


NSString  *const cellId = @"cellId";
@implementation SHLoopView

{
   NSArray <NSURL *> *_urls;

}
- (instancetype)initWithURLs:(NSArray <NSURL *> *)urls
{
    if (self = [super initWithFrame:CGRectZero collectionViewLayout:[[SHLoopFlowLayout alloc] init]])
    {
        
        self.dataSource = self;
        self.delegate = self;
        
        _urls = urls;
        
        [self registerClass:[SHLoopCell class] forCellWithReuseIdentifier:cellId];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_urls.count inSection:0];
            
            [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
            
        });
        
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _urls.count * 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SHLoopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
    
    cell.url = _urls[indexPath.item % _urls.count];
    
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSInteger offset = scrollView.contentOffset.x / scrollView.bounds.size.width;
    if (offset == 0 || ([self numberOfItemsInSection:0] - 1))
    {
        
        if (offset == 0)
        {
            offset = _urls.count;
        }else
        {
            offset = _urls.count - 1;
        }
        
        // 重新调整
        
        scrollView.contentOffset = CGPointMake(offset * scrollView.bounds.size.width, 0);
    }
}


@end
