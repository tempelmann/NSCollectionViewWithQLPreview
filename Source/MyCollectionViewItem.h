#import <Cocoa/Cocoa.h>

@interface MyCollectionViewItem : NSCollectionViewItem <NSCollectionViewElement>
	@property (weak) IBOutlet NSView *qlViewContainer;
	@property NSInteger serialNum;
@end
