//
//  BrowserController.m
//  RSSReader


#import "BrowserController.h"

#import "Helper.h"

@interface BrowserController ()

//@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityInd;

@end

@implementation BrowserController

# pragma mark - UIViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupwebView];
    [self setupUserInterface];
}

- (void)_setupwebView{
    
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.webView.translatesAutoresizingMaskIntoConstraints = false;
    //top
    NSLayoutConstraint *top = [NSLayoutConstraint
                                     constraintWithItem: self.webView
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.topLayoutGuide
                                     attribute:NSLayoutAttributeBottom
                                     multiplier:1.0f
                                     constant:0.f];
    
    //leading
    NSLayoutConstraint *leading = [NSLayoutConstraint
                                     constraintWithItem: self.webView
                                     attribute:NSLayoutAttributeLeading
                                     relatedBy:NSLayoutRelationEqual
                                     toItem: self.view
                                     attribute:NSLayoutAttributeLeading
                                     multiplier:1.0f
                                     constant:0.f];
    NSLayoutConstraint *trailing = [NSLayoutConstraint
                                     constraintWithItem: self.webView
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                     attribute:NSLayoutAttributeTrailing
                                     multiplier:1.0f
                                     constant:0.f];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint
                                     constraintWithItem: self.webView
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                     attribute:NSLayoutAttributeBottom
                                     multiplier:1.0f
                                     constant:0.f];
    

   
    [self.view addSubview:self.webView];
    
    [self.view addConstraint:top];
    [self.view addConstraint:trailing];
    [self.view addConstraint:leading];
    [self.view addConstraint:bottom];
}

# pragma mark - Setup User Interface
// setting up user interface
- (void)setupUserInterface {
    Helper *helper = [Helper sharedInstance];
    self.navigationItem.title = [helper getLocalizedString:@"Browse"];
    [self showNewsInBrowser];
}

// load feed by link url
- (void)showNewsInBrowser {
    if (self.feedUrlStr) {
        NSURL *feedUrl = [NSURL URLWithString:self.feedUrlStr];
        NSURLRequest *webRequest = [NSURLRequest requestWithURL:feedUrl];
        [self.webView loadRequest:webRequest];
    }
}

# pragma mark - UIWebViewDelegate
// perform when feed did start loading
- (void)webViewDidStartLoad:(UIWebView *)webView {
    // start animating activity indicator
    [self.activityInd startAnimating];
}

// perform when feed did finish loading
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // stop animating activity indicator
    [self.activityInd stopAnimating];
}

// perform when feed did fail loading with error
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"Error web loading: %@", error);
    // stop animating activity indicator
    [self.activityInd stopAnimating];
    // return to DetailsController
    [self.navigationController popViewControllerAnimated:true];
}

@end
