//
//  FeedViewModel.h
//  RSSReader

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FeedViewModel : NSObject

@property (strong, nonatomic) NSMutableArray *feedsArray;
@property (strong, nonatomic) NSString *channelTitle;
@property (strong, nonatomic) NSNumber *isDisconnected;
@property (strong, nonatomic) NSNumber *hasReceivedError;

- (void)loadFeedsbyURL:(NSURL *) url;
- (void)searchFeedByTitlePrefix:(NSString *) prefix;
- (void)fetchAllFeedSortedByAttribute;

@end

NS_ASSUME_NONNULL_END
