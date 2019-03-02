#import "MyCollectionViewItem.h"

static NSInteger lastSerialNum = 0;
static NSInteger instanceCount = 0;

@implementation MyCollectionViewItem

- (void)awakeFromNib {
	++instanceCount;
	self.serialNum = lastSerialNum++;
	NSLog(@"create #%ld (now %ld)", self.serialNum, instanceCount);
	[super awakeFromNib];
}

- (void)dealloc {
	// this never gets called, not even when the window is closed -- why?
	--instanceCount;
	NSLog(@"delete #%ld (now %ld)", self.serialNum, instanceCount);
}

-(void)setRepresentedObject:(id)representedObject {
	NSLog(@"update #%ld: %@", self.serialNum, representedObject);
	[super setRepresentedObject:representedObject];
}

- (void)prepareForReuse {
	NSLog(@"reuse #%ld", self.serialNum);
	[super prepareForReuse];
}

@end
