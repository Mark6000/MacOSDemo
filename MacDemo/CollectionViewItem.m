//
//  CollectionViewItem.m
//  5.22MacDemo
//
//  Created by catbook on 2018/5/25.
//  Copyright © 2018年 catbook. All rights reserved.
//

#import "CollectionViewItem.h"

@interface CollectionViewItem ()
@property (strong) IBOutlet NSView *backView;

@end

@implementation CollectionViewItem

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backView.wantsLayer = YES;
    self.backView.layer.backgroundColor = [NSColor cyanColor].CGColor;
}

@end
