//
//  ViewController.m
//  NSCollectionViewTest
//

#import <Quartz/Quartz.h>
#import "ViewController.h"
#import "MyCollectionViewItem.h"
#import "MyPreviewView.h"
#import "MyPreviewItem.h"


@interface ViewController()
	@property (strong) NSMutableArray<NSMutableDictionary*> *contents;
@end


@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	self.contents = [NSMutableArray new];
	NSString *dirPath = @"/Library/User Pictures";
	NSFileManager *fm = [NSFileManager defaultManager];
	NSDirectoryEnumerator *dirEnum = [fm enumeratorAtPath:dirPath];
	NSString *fileName;
	int i = 0;
	while ((fileName = [dirEnum nextObject])) {
		NSURL *url = [NSURL fileURLWithPath:[dirPath stringByAppendingPathComponent:fileName]];
		if (url.hasDirectoryPath) {
			//[dirEnum skipDescendents];
		} else {
			++i;
			NSMutableDictionary *item = [NSMutableDictionary dictionary];
			item[@"itemTitle"] = [NSString stringWithFormat:@"%d: %@", i, fileName];
			item[@"itemURL"] = url;
			[self.contents addObject:item];
		}
	}

	[self.collectionView registerClass:[MyCollectionViewItem class] forItemWithIdentifier:@"MyCollectionViewItem"];
	self.collectionView.dataSource = self;
}

- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return self.contents.count;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger fileIdx = [indexPath indexAtPosition:1];
	MyCollectionViewItem *item = [collectionView makeItemWithIdentifier:@"MyCollectionViewItem" forIndexPath:indexPath];
	item.textField.stringValue = [NSString stringWithFormat:@"Idx %ld (#%ld)", fileIdx, item.serialNum];

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

	NSDictionary *content = self.contents[fileIdx];
	item.representedObject = content;

	MyPreviewItem *previewItem = [MyPreviewItem new];
	previewItem.previewItemURL = content[@"itemURL"];
	previewItem.previewItemTitle = content[@"itemTitle"];
	qlView.previewItem = previewItem;

	return item;
}

@end
