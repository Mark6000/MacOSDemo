//
//  AppDelegate.m
//  MacDemo
//
//  Created by catbook on 2018/6/4.
//  Copyright © 2018年 catbook. All rights reserved.
//

#import "AppDelegate.h"
#import "CollectionViewItem.h"
@interface AppDelegate ()<NSCollectionViewDataSource,NSCollectionViewDelegate>
@property (weak) IBOutlet NSCollectionView *collectionView;

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate   = self;
    [_collectionView registerClass:[CollectionViewItem class] forItemWithIdentifier:@"1212"];
    NSCollectionViewFlowLayout *layout = (NSCollectionViewFlowLayout *)_collectionView.collectionViewLayout;
    layout.itemSize = NSMakeSize(self.collectionView.frame.size.width, 100);
    _collectionView.collectionViewLayout = layout;
}
- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}
- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewItem *item = [[CollectionViewItem alloc] initWithNibName:@"CollectionViewItem" bundle:nil];
    
    return item;
}
- (void)collectionView:(NSCollectionView *)collectionView didSelectItemsAtIndexPaths:(NSSet<NSIndexPath *> *)indexPaths{
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
