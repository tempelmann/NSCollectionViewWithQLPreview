#import <Quartz/Quartz.h>
#import "MyCollectionViewItem.h"

static NSInteger lastSerialNum = 0;
static NSInteger instanceCount = 0;

@implementation MyCollectionViewItem

- (void)awakeFromNib {
	++instanceCount;
	self.serialNum = ++lastSerialNum;
	NSLog(@"new item #%ld (now %ld)", self.serialNum, instanceCount);
	[super awakeFromNib];
}

- (void)dealloc {
	--instanceCount;
	NSLog(@"delete item #%ld (now %ld)", self.serialNum, instanceCount);
	[self removeQLView];
}

/*
- (void)viewWillAppear {
	NSLog(@"will appear #%ld", self.serialNum);
	[super viewWillAppear];
}

- (void)viewDidAppear {
	NSLog(@"did appear #%ld", self.serialNum);
	[super viewDidAppear];
}

- (void)viewWillDisappear {
	NSLog(@"will disappear #%ld", self.serialNum);
	//[self removeQLView];
	[super viewWillDisappear];
}

- (void)viewDidDisappear {
	NSLog(@"did disappear #%ld", self.serialNum);
	//[self removeQLView];
	[super viewDidDisappear];
}
*/

-(void)setRepresentedObject:(id)representedObject {
	//NSLog(@"update item #%ld: %@", self.serialNum, representedObject);
	[super setRepresentedObject:representedObject];
}

- (void)prepareForReuse {
	NSLog(@"reuse item #%ld (now %ld)", self.serialNum, instanceCount);
	[super prepareForReuse];
	[self removeQLView];
}

- (void)removeQLView {
	if (self.qlViewContainer.subviews > 0) {
		QLPreviewView *qlView = self.qlViewContainer.subviews[0];
		NSParameterAssert(qlView);
		qlView.previewItem = nil;
		[qlView refreshPreviewItem];
		[qlView close];
		[qlView removeFromSuperview];
	}
}

@end
