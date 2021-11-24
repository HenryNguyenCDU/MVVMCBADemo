//
//  DetailController.h
//  RSSReader


#import <UIKit/UIKit.h>
#import "Feed.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailController : UIViewController

@property (strong, nonatomic)  UIImageView *detailImageImg;
@property (strong, nonatomic)  UILabel *detailTitleLbl;
@property (strong, nonatomic)  UITextView *detailDescrTxt;

@property (strong, nonatomic) UIPinchGestureRecognizer *pinchGesture;
@property (assign, nonatomic) CGFloat currentScale;
@property (assign, nonatomic) BOOL isFullScreen;
@property (strong, nonatomic) Feed *feed;

@end

NS_ASSUME_NONNULL_END
