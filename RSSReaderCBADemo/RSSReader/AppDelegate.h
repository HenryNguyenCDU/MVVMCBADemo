//
//  AppDelegate.h
//  RSSReader


#import <UIKit/UIKit.h>
#import "FeedController.h"
#import <MagicalRecord/MagicalRecord.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) FeedController *firstViewController;
@end

