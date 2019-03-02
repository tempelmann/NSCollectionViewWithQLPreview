//
//  ViewController.m
//  NSCollectionViewTest
//

#import "ViewController.h"
#import "MyCollectionViewItem.h"

@interface ViewController ()
	@property (weak) IBOutlet NSCollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.collectionView registerClass:[MyCollectionViewItem class] forItemWithIdentifier:@"MyCollectionViewItem"];
	self.collectionView.dataSource = self;
}

- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 1000;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath {
	MyCollectionViewItem *item = [collectionView makeItemWithIdentifier:@"MyCollectionViewItem" forIndexPath:indexPath];
	item.textField.stringValue = [NSString stringWithFormat:@"Idx %ld (#%ld)", [indexPath indexAtPosition:1], item.serialNum];
	return item;
}

@end
