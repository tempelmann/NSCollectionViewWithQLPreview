//
//  ViewController.m
//  NSCollectionViewTest
//

#import <Quartz/Quartz.h>
#import "ViewController.h"
#import "MyCollectionViewItem.h"
#import "MyPreviewView.h"
#import "MyPreviewItem.h"

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.collectionView registerClass:[MyCollectionViewItem class] forItemWithIdentifier:@"MyCollectionViewItem"];
	self.collectionView.dataSource = self;
}

- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 1000;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
	MyCollectionViewItem *item = [collectionView makeItemWithIdentifier:@"MyCollectionViewItem" forIndexPath:indexPath];
	item.textField.stringValue = [NSString stringWithFormat:@"Idx %ld (#%ld)", [indexPath indexAtPosition:1], item.serialNum];

	MyPreviewItem *previewItem = [MyPreviewItem new];
	NSURL *url = [NSURL fileURLWithPath:@"/System"];
	previewItem.previewItemURL = url;
	previewItem.previewItemTitle = item.textField.stringValue;

	QLPreviewView *qlView = [[MyPreviewView alloc] initWithFrame:item.qlViewContainer.frame style:QLPreviewViewStyleCompact];
	qlView.previewItem = previewItem;
	qlView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
	NSParameterAssert(item.qlViewContainer.subviews.count==0);
	[item.qlViewContainer addSubview:qlView];

	return item;
}

@end
