//
//  Feed+CoreDataClass.h


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
// project files
#import "FeedModelAPI.h"

NS_ASSUME_NONNULL_BEGIN

@interface Feed : NSManagedObject
- (void)createFrom: (FeedModelAPI*) feedModelApi;
@end

NS_ASSUME_NONNULL_END

#import "Feed+CoreDataProperties.h"
