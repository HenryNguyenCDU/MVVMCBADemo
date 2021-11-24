//
//  FeedCell.h
//  RSSReader


#import "Feed.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedCell : UITableViewCell
@property (nonatomic, assign) CGRect cellFrame;
- (void)configureCellWith:(Feed *)feed;
@end

NS_ASSUME_NONNULL_END
