//
//  ViewController.h
//  NSCollectionViewTest
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSCollectionViewDataSource>
	@property (weak) IBOutlet NSCollectionView *collectionView;
@end

