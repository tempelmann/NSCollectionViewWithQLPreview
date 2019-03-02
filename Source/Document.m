//
//  Document.m
//  NSCollectionViewTest
//

#import "Document.h"

@implementation Document

- (void)makeWindowControllers {
	[self addWindowController:[[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"Document Window Controller"]];
}

@end
