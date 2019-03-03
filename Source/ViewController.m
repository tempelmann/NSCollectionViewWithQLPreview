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

	QLPreviewView *qlView;
	if (item.qlViewContainer.subviews.count == 0) {
		qlView = [[MyPreviewView alloc] initWithFrame:item.qlViewContainer.frame style:QLPreviewViewStyleCompact];
		qlView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
		qlView.shouldCloseWithWindow = NO;	// Necessary to prevent an assertion error, see https://stackoverflow.com/questions/54963202/
		[item.qlViewContainer addSubview:qlView];
	} else {
		// We should never get here as long as MyCollectionViewItem's prepareForReuse discards the QLPreviewView as expected
		qlView = item.qlViewContainer.subviews[0];
		assert(qlView.previewItem==nil);
	}
	qlView.previewItem = previewItem;

	return item;
}

@end
