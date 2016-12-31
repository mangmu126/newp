//
//  SHLoopFlowLayout.m
//  无限轮播器
//
//  Created by macbook pro on 16/10/20.
//  Copyright © 2016年 itcsas. All rights reserved.
//

#import "SHLoopFlowLayout.h"

@implementation SHLoopFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    self.itemSize = self.collectionView.bounds.size;
    
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;

    
}

@end
