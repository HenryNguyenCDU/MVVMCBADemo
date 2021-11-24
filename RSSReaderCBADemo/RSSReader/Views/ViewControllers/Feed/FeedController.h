//
//  FeedController.h
//  RSSReader

#import <UIKit/UIKit.h>
#import "FeedViewModel.h"
#import "Helper.h"

@interface FeedController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate >
@property (strong, nonatomic) Helper *helper;
@property (strong, nonatomic) FeedViewModel *feedViewModel;


@end

