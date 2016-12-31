//
//  SHLoopCell.m
//  无限轮播器
//
//  Created by macbook pro on 16/10/20.
//  Copyright © 2016年 itcsas. All rights reserved.
//

#import "SHLoopCell.h"


@implementation SHLoopCell {
    UIImageView *_imageView;
}

// collectionViewCell 的 frame 是根据之前的 layout 已经确定好的！
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"%@", NSStringFromCGRect(frame));
        
        // 添加图像视图
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [self.contentView addSubview:_imageView];
        _imageView.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (void)setUrl:(NSURL *)url {
    _url = url;
    
    // 1. 根据 URL 获取二进制数据
    NSData *data = [NSData dataWithContentsOfURL:url];
    // 2. 将二进制数据转换成图像
    UIImage *image = [UIImage imageWithData:data];
    
    _imageView.image = image;
}


@end
