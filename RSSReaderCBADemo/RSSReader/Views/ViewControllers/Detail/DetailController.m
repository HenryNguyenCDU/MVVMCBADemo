//
//  DetailController.m
//  RSSReader


#import "DetailController.h"
#import "DetailController+ImageGestures.h"
// libraries
#import "UIImageView+AFNetworking.h"
// project files
#import "BrowserController.h"
#import "Helper.h"

// storyboard name
static NSString * const STORYBOARD_NAME = @"Browser";
// controller identifier
static NSString * const CONTROLLER_ID = @"BrowserControllerID";


@interface DetailController()


@end

@implementation DetailController 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)_setupImgView{
    
    self.detailImageImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.detailImageImg.translatesAutoresizingMaskIntoConstraints = false;
    self.detailImageImg.contentMode = UIViewContentModeScaleAspectFill;
    
    //top
    NSLayoutConstraint *top = [NSLayoutConstraint
                                     constraintWithItem: self.detailImageImg
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.topLayoutGuide
                                     attribute:NSLayoutAttributeBottom
                                     multiplier:1.0f
                                     constant:0.f];
    
    //leading
    NSLayoutConstraint *leading = [NSLayoutConstraint
                                     constraintWithItem: self.detailImageImg
                                     attribute:NSLayoutAttributeLeading
                                     relatedBy:NSLayoutRelationEqual
                                     toItem: self.view
                                     attribute:NSLayoutAttributeLeading
                                     multiplier:1.0f
                                     constant:0.f];
    NSLayoutConstraint *trailing = [NSLayoutConstraint
                                     constraintWithItem: self.detailImageImg
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                     attribute:NSLayoutAttributeTrailing
                                     multiplier:1.0f
                                     constant:0.f];
    
    NSLayoutConstraint *heighImg = [NSLayoutConstraint
                                     constraintWithItem: self.detailImageImg
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                     multiplier:1.0f
                                      constant:240];
   
    [self.view addSubview:self.detailImageImg];
    
    [self.view addConstraint:top];
    [self.view addConstraint:trailing];
    [self.view addConstraint:leading];
    [self.view addConstraint:heighImg];
}

- (void)_setupTitleView{
    
    //title
    self.detailTitleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.detailTitleLbl.translatesAutoresizingMaskIntoConstraints = false;
    self.detailTitleLbl.numberOfLines = 0;
    [self.detailTitleLbl setFont:[UIFont systemFontOfSize:16]];
  
    //calculate the heigh of the text return
    // UILabel *myLabel;

  //  CGSize labelSize = [self.detailTitleLbl.text sizeWithFont:self.detailTitleLbl.font
 //                               constrainedToSize:self.detailTitleLbl.frame.size
 //                                   lineBreakMode:NSLineBreakByWordWrapping];
    
 //   CGFloat labelHeight = labelSize.height;

    
    //top
    NSLayoutConstraint *topTitle = [NSLayoutConstraint
                                     constraintWithItem: self.detailTitleLbl
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.detailImageImg
                                     attribute:NSLayoutAttributeBottom
                                     multiplier:1.0f
                                     constant:0.f];
    
    //leading
    NSLayoutConstraint *leadingTitle = [NSLayoutConstraint
                                     constraintWithItem: self.detailTitleLbl
                                     attribute:NSLayoutAttributeLeading
                                     relatedBy:NSLayoutRelationEqual
                                     toItem: self.detailImageImg
                                     attribute:NSLayoutAttributeLeading
                                     multiplier:1.0f
                                     constant: 5.f];
    NSLayoutConstraint *trailingTitle = [NSLayoutConstraint
                                     constraintWithItem: self.detailTitleLbl
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.detailImageImg
                                     attribute:NSLayoutAttributeTrailing
                                     multiplier:1.0f
                                     constant:0.f];
    
    NSLayoutConstraint *heighTitle = [NSLayoutConstraint
                                     constraintWithItem: self.detailTitleLbl
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                     multiplier:1.0f
                                      constant:72];
    
    self.detailTitleLbl.textColor = [UIColor blackColor];
    [self.view addSubview: self.detailTitleLbl];
    //
    [self.view addConstraint:topTitle];
    [self.view addConstraint:trailingTitle];
    [self.view addConstraint:leadingTitle];
    [self.view addConstraint:heighTitle];
    
  //  [self.detailTitleLbl.topAnchor constraintEqualToAnchor:self.detailImageImg.bottomAnchor constant:10].active = YES;
  //  [self.detailTitleLbl.leadingAnchor constraintEqualToAnchor:self.detailImageImg.leadingAnchor constant:0].active = YES;
  //  [self.detailTitleLbl.trailingAnchor constraintEqualToAnchor:self.detailImageImg.trailingAnchor constant:0].active = YES;
   // [self.detailTitleLbl.heightAnchor constraintEqualToConstant:72].active = YES;

}



- (void)_setupDetailView{
    
    // detail text
    self.detailDescrTxt = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.detailDescrTxt.translatesAutoresizingMaskIntoConstraints = false;
   
    
    //top
    NSLayoutConstraint *topDescTitle = [NSLayoutConstraint
                                     constraintWithItem: self.detailDescrTxt
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.detailTitleLbl
                                     attribute:NSLayoutAttributeBottom
                                     multiplier:1.0f
                                     constant:0.f];
    
    //leading
    NSLayoutConstraint *leadingDescTitle = [NSLayoutConstraint
                                     constraintWithItem: self.detailDescrTxt
                                     attribute:NSLayoutAttributeLeading
                                     relatedBy:NSLayoutRelationEqual
                                     toItem: self.view
                                     attribute:NSLayoutAttributeLeading
                                     multiplier:1.0f
                                     constant:0.f];
    NSLayoutConstraint *trailingDescTitle = [NSLayoutConstraint
                                     constraintWithItem: self.detailDescrTxt
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                     attribute:NSLayoutAttributeTrailing
                                     multiplier:1.0f
                                     constant:0.f];
    
    NSLayoutConstraint *bottomDescTitle = [NSLayoutConstraint
                                     constraintWithItem: self.detailDescrTxt
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                     attribute:NSLayoutAttributeBottom
                                     multiplier:1.0f
                                     constant:-0.f];
  
    self.detailDescrTxt.backgroundColor = [UIColor lightGrayColor];
    [self.detailDescrTxt setFont:[UIFont systemFontOfSize:16]];
    //
    [self.view addSubview: self.detailDescrTxt];
    [self.view addConstraint:topDescTitle];
    [self.view addConstraint:leadingDescTitle];
    [self.view addConstraint:trailingDescTitle];
    [self.view addConstraint:bottomDescTitle];
}
 
- (void) loadView
{
    [super loadView]; // Actually loads and assigns the default view

    [self _setupImgView];
    [self _setupTitleView];
    [self _setupDetailView];
    [self setupUserInterface];

 //   [self.view setNeedsLayout];
    self.view.backgroundColor = [UIColor whiteColor];

}

# pragma mark - Setup User Interface
- (void)setupUserInterface {
    // setting title
    self.navigationItem.title = [[Helper sharedInstance] getLocalizedString:@"Details"];
    // setting custom right button
    [self setCustomRightBarButtonItem];
    // setting custom back button
    [self setCustomBackBarButtonItem];
    // setting image tap gesture
    [self setTapGesture];
    // setting interface by feed model

    if (self.feed) {
        [self showDetailedFeed];
    }
}

// setting views by feed model
- (void)showDetailedFeed {
    self.detailTitleLbl.text = self.feed.title;
    NSURL *imageUrl = [NSURL URLWithString:self.feed.image_url];
    [self.detailImageImg setImageWithURL:imageUrl];
    self.detailDescrTxt.text = self.feed.summary;
}

// setting custom right navigation bar button
- (void)setCustomRightBarButtonItem {
    // getting image
    UIImage *browseButtonIcon = [UIImage imageNamed:@"browse_icon"];
    // setting button by image
    UIBarButtonItem *browseBtn = [[UIBarButtonItem alloc]
                                  initWithImage:browseButtonIcon
                                  style:UIBarButtonItemStylePlain
                                  target:self
                                  action:@selector(browseInWeb)];
    self.navigationItem.rightBarButtonItem = browseBtn;
}

// setting custom back button
- (void)setCustomBackBarButtonItem {
    UIBarButtonItem *backItem = [UIBarButtonItem new];
    backItem.title = @"";
    [self.navigationItem setBackBarButtonItem:backItem];
}


# pragma mark - Segue to BrowserController
// segue into BrowserController
- (void)browseInWeb {

    BrowserController *browserVC  = [[BrowserController alloc] init];
    browserVC.feedUrlStr = self.feed.link_url;
    UINavigationController *navigationVC = self.navigationController;
    [navigationVC pushViewController:browserVC animated:true];
}

@end
