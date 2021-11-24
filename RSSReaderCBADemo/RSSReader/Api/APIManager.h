//
//  ApiManager.h
//  RSSReader

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APIManager : NSObject
- (void)getFeedsWithURL:(NSURL*) url handler:(void (^)(NSArray* _Nullable fetchedFeed, NSError* _Nullable error)) block;
@end

NS_ASSUME_NONNULL_END
