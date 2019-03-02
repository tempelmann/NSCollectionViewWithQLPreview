//
//  MyPreviewItem.m
//  NSCollectionViewTest
//

#import "MyPreviewItem.h"

static NSInteger lastSerialNum = 0;
static NSInteger instanceCount = 0;

@implementation MyPreviewItem

- (instancetype)init
{
	self = [super init];
	if (self) {
		++instanceCount;
		self.serialNum = ++lastSerialNum;
		NSLog(@"new previewItem #%ld (now %ld)", self.serialNum, instanceCount);
	}
	return self;
}

-(void)dealloc {
	NSLog(@"delete previewItem #%ld (now %ld)", self.serialNum, instanceCount);
}

@end
