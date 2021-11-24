//
//  BrowserController.h
//  RSSReader
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BrowserController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) NSString *feedUrlStr;
@property (strong, nonatomic)  UIWebView *webView;

@end

NS_ASSUME_NONNULL_END
