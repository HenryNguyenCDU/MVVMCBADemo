//
//  Feed+CoreDataClass.m


#import "Feed.h"
#import "Feed+CoreDataProperties.h"
// libraries
#import <MagicalRecord/MagicalRecord.h>
// project files
#import "FeedModelAPI.h"

@implementation Feed

- (void)createFrom: (FeedModelAPI*) feedModelApi {
    self.title = feedModelApi.title;
    self.summary = feedModelApi.summary;
    self.publication_date = feedModelApi.publicationDate;
    self.link_url= feedModelApi.linkUrl;
    self.image_url = feedModelApi.imageUrl;
}

@end
