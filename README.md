# NSCollectionViewWithQLPreview
Demonstrates the use of an `NSCollectionView` using a `QLPreviewView` with each collection item.

Currently, this does not work though - when scrolling down, it'll eventually run into an assertion error of this kind:

    [QL] Assertion failure (unreachable code) - [… MyPreviewView activated … doc:[QLPreviewDocument …]] is already activated

It is yet to be determined where the cause for this error lies.
