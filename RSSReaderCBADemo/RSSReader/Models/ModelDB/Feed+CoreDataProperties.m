//
//  Feed+CoreDataProperties.m
#import "Feed+CoreDataProperties.h"

@implementation Feed (CoreDataProperties)

+ (NSFetchRequest<Feed *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Feed"];
}

@dynamic image_url;
@dynamic link_url;
@dynamic publication_date;
@dynamic summary;
@dynamic title;

@end
