//
//  CollectionViewItem.h
//  5.22MacDemo
//
//  Created by catbook on 2018/5/25.
//  Copyright © 2018年 catbook. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CollectionViewItem : NSCollectionViewItem
@property (weak) IBOutlet NSImageView *imgView;
@property (weak) IBOutlet NSTextField *cusTextField;

@end
