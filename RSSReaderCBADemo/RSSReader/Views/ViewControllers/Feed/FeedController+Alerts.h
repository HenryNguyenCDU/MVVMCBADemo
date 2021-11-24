//
//  FeedController+Alerts.h
//  RSSReader

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FeedController(Alerts)
- (void)changeRssChannelAlert;
- (void)fetchFromDBIfDisconnectedAlert;
- (void)showRequestErrorAlert;
@end

NS_ASSUME_NONNULL_END
