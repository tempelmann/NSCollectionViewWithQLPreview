//
//  MyPreviewItem.h
//  NSCollectionViewTest
//

#import <Foundation/Foundation.h>
#import <Quartz/Quartz.h>

@interface MyPreviewItem : NSObject <QLPreviewItem>
	@property NSURL *previewItemURL;
	@property NSString *previewItemTitle;
	@property NSInteger serialNum;
@end
