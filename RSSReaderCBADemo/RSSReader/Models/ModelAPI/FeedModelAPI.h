//
//  FeedModelAPI.h
//  RSSReader

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FeedModelAPI : NSObject

// feed's title
@property (strong, nonatomic) NSString *title;
// feed's description
@property (strong, nonatomic) NSString *summary;
// date of publishing
@property (strong, nonatomic) NSDate *publicationDate;
// feeds url in web
@property (strong, nonatomic) NSString *linkUrl;
// image url
@property (strong, nonatomic) NSString *imageUrl;

- (instancetype)initWith:(NSDictionary*) item;
@end

NS_ASSUME_NONNULL_END
