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


/** 添加布局属性 */
@property (strong) NSCollectionViewFlowLayout *flowLayout;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate   = self;
    [_collectionView registerClass:[CollectionViewItem class] forItemWithIdentifier:@"1212"];
    NSCollectionViewFlowLayout *layout = (NSCollectionViewFlowLayout *)_collectionView.collectionViewLayout;
    layout.itemSize = NSMakeSize(self.collectionView.frame.size.width, 100);
    _collectionView.collectionViewLayout = layout;
    
    
    /** 使用成员属性记录CollectionView的flowLayout,当窗口size变化时,更新这个属性 */
    self.flowLayout = layout;
    /** 根据你这个demo示例, 就采用通知方式监听window的size 变化
     * 也可以使用自定义window的方式进行size变化监听
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeWindowSize:) name:NSWindowDidResizeNotification object:nil];
    
}
#pragma mark - 自定义方法实现接收通知,监听窗口size变化
- (void)changeWindowSize:(NSNotification *)noti{
    // 1.获取最新的窗口frame
    NSRect newWindowRect = self.window.frame;
    // 2. 更新CollectionView的flowLayout布局
    /** 这里CollectionView的itemSize要如何变化,需要根据你的需求来计算一下就可以了
     * 这里仅是改变了高度:每个item的高度为当前窗口高度的1/5
     */
    self.flowLayout.itemSize =NSMakeSize(newWindowRect.size.width, newWindowRect.size.height * 0.2);
}

#pragma mark - NSCollectionView DataSource
- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}
- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath{
    
    /** 因为CollectionView已经注册过item class 因此不用判断为nil的情况,如果没有复用item,CollectionView会根据注册的item class 自动创建一个新的item */
     CollectionViewItem *reusedItem = [collectionView makeItemWithIdentifier:@"1212" forIndexPath:indexPath];
    
    /** 不推荐使用下面的[[alloc]initXX]的方法创建每个CollectionView的item ,这样是没有复用效果的
     * 推荐使用CollectionView的makeXXX方法 (这个类似iOS中TableView的 dequeue的效果复用cell)
     */
//    CollectionViewItem *item = [[CollectionViewItem alloc] initWithNibName:@"CollectionViewItem" bundle:nil];
    /** UI效果 测试代码 */
    reusedItem.cusTextField.stringValue = [NSString stringWithFormat:@"我是第%zd个企鹅",indexPath.item];
    
    return reusedItem;
}
- (void)collectionView:(NSCollectionView *)collectionView didSelectItemsAtIndexPaths:(NSSet<NSIndexPath *> *)indexPaths{
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}




@end
