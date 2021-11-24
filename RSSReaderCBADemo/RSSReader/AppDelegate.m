//
//  AppDelegate.m
//  RSSReader


#import "AppDelegate.h"
#import "Helper.h"


@implementation AppDelegate
//@synthesize navigationController;
//@synthesize firstViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //Objective-C
    
       //create the navigation controller and add the controllers view to the window
   //    self.navigationController = [[UINavigationController alloc] init];
   //    [self.window addSubview:[self.navigationController view]];
        
       //check if the first viewcontroller eixsts, otherwise create it
    //   if(self.firstViewController == nil)
    //   {
    //       FeedController *firstView = [[FeedController alloc] init];
   //        self.firstViewController = firstView;
   //    }
        
       //push the first viewcontroller into the navigation view controller stack
   //    [self.navigationController pushViewController:self.firstViewController animated:YES];
    
    
    // set MagicalRecord
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"Feed"];
    // set current channel url
    [self setCurrentUrl];
    return YES;
}

# pragma mark - Custom functions
// initialize current url with bbc url
- (void)setCurrentUrl {
    // get user defaults manager
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    // if application has launched first time - set bbc url
    if ([userDefaults URLForKey:@"current_url"] == nil) {
        // get bbc url from helper
        Helper *helper = [Helper sharedInstance];
        NSURL *initialUrl = [helper getWashPostUrl];
        // set current channel url to user defaults storage
        [userDefaults setURL:initialUrl forKey:@"current_url"];
        [userDefaults setObject:@"wp" forKey:@"current_channel"];
    }
}

@end
