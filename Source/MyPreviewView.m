//
//  MyPreviewView.m
//  NSCollectionViewTest
//

#import "MyPreviewView.h"

static NSInteger lastSerialNum = 0;
static NSInteger instanceCount = 0;

@implementation MyPreviewView

- (instancetype)initWithFrame:(NSRect)frame style:(QLPreviewViewStyle)style
{
	self = [super initWithFrame:frame style:style];
	if (self) {
		++instanceCount;
		self.serialNum = ++lastSerialNum;
		NSLog(@"new previewView #%ld (now %ld)", self.serialNum, instanceCount);
	}
	return self;
}

-(NSString *)description {
	return [NSString stringWithFormat:@"%@ #%ld", [super description], self.serialNum];
}

-(void)dealloc {
	--instanceCount;
	NSLog(@"delete previewView #%ld (now %ld)", self.serialNum, instanceCount);
}

@end
