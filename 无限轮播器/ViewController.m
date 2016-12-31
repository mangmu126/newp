//
//  ViewController.m
//  无限轮播器
//
//  Created by macbook pro on 16/10/20.
//  Copyright © 2016年 itcsas. All rights reserved.
//

#import "ViewController.h"
#import "SHLoopView.m"
@interface ViewController ()

@end

@implementation ViewController
{
    
    NSArray <NSURL *>*_urls;
    
}


- (void)loadData
{
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i <3; i++)
    {
        NSString *fileName = [NSString stringWithFormat:@"%02zd.jpg", (i + 1)];
        NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
        [array addObject:url];
    }
    
    _urls = array.copy;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SHLoopView *loopView = [[SHLoopView alloc] initWithURLs:_urls];
    loopView.frame = CGRectMake(20, 20, self.view.bounds.size.width - 40, 200);
    
    [self.view addSubview:loopView];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
