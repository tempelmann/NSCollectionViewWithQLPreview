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
}

-(void)setRepresentedObject:(id)representedObject {
	NSLog(@"update item #%ld: %@", self.serialNum, representedObject);
	[super setRepresentedObject:representedObject];
}

- (void)prepareForReuse {
	NSLog(@"reuse item #%ld", self.serialNum);
	QLPreviewView *qlView = self.qlViewContainer.subviews[0];
	NSParameterAssert(qlView);
	[qlView close];
	[qlView removeFromSuperview];
	[super prepareForReuse];
}

@end
