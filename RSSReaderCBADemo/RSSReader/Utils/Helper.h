//
//  Helper.h
//  RSSReader


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Helper : NSObject

+ (id)sharedInstance;
- (NSURL *)getWashPostUrl;
- (NSURL *)getDailyMirrorUrl;
- (NSString *)getLocalizedString:(NSString *) key;
    
@end

NS_ASSUME_NONNULL_END
