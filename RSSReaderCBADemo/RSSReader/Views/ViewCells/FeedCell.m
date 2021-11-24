//
//  FeedCell.m
//  RSSReader


#import <UIKit/UIKit.h>
#import "UIImageView+AFNetworking.h"

#import "FeedCell.h"
#import "Feed.h"

@interface FeedCell()
//@property (weak, nonatomic) IBOutlet UIImageView *imageImg;
//@property (weak, nonatomic) IBOutlet UILabel *titleLbl;

@property (nonatomic)  UIImageView *imageImg;
@property (nonatomic)  UILabel *titleLbl;
//@property (nonatomic, assign) CGRect cellFrame;
@end

@implementation FeedCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        

        self.backgroundColor = [UIColor clearColor];
        [self addContent];
      //  [self.contentView layoutIfNeeded];
       
    }
    return self;
}

- (void)addText{
    
    
}

- (void)layoutSubviews
{
  //  [self layoutSubviews];
}


- (void)addContent{
    self.imageImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.imageImg.translatesAutoresizingMaskIntoConstraints = false;

   //
    self.titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(0,0,0,0)];

    self.titleLbl.numberOfLines = 0;
    self.titleLbl.translatesAutoresizingMaskIntoConstraints = false;
    [self.titleLbl setFont:[UIFont systemFontOfSize:15]];
    self.titleLbl.textColor = [UIColor whiteColor];

    //top
    NSLayoutConstraint *top = [NSLayoutConstraint
                                     constraintWithItem: self.imageImg
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.contentView
                                     attribute:NSLayoutAttributeTop
                                     multiplier:1.0f
                                     constant:0.f];
    
    //leading
    NSLayoutConstraint *leading = [NSLayoutConstraint
                                     constraintWithItem: self.imageImg
                                     attribute:NSLayoutAttributeLeading
                                     relatedBy:NSLayoutRelationEqual
                                     toItem: self.contentView
                                     attribute:NSLayoutAttributeLeading
                                     multiplier:1.0f
                                     constant:0.f];
    //trailing
    NSLayoutConstraint *trailing = [NSLayoutConstraint
                                     constraintWithItem: self.imageImg
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.contentView
                                     attribute:NSLayoutAttributeTrailing
                                     multiplier:1.0f
                                     constant:0];
    
    //trailing
//    NSLayoutConstraint *bottom = [NSLayoutConstraint
//                                     constraintWithItem: self.imageImg
//                                     attribute:NSLayoutAttributeBottom
//                                     relatedBy:NSLayoutRelationEqual
//                                     toItem:self.contentView
//                                     attribute:NSLayoutAttributeBottom
//                                     multiplier:1.0f
//                                     constant:0];
    
    NSLayoutConstraint *heighTitle = [NSLayoutConstraint
                                     constraintWithItem: self.imageImg
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                     multiplier:1.0f
                                     constant:170];
    

   
    [self.contentView addSubview:self.imageImg];
    [self.contentView addSubview:self.titleLbl];
    
    [self.imageImg.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:0].active = YES;
    [self.imageImg.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:0].active = YES;
    [self.imageImg.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:0].active = YES;
    [self.imageImg.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:0].active = YES;
  
    //
  
    [self.titleLbl.leadingAnchor constraintEqualToAnchor:self.imageImg.leadingAnchor constant:0].active = YES;
    [self.titleLbl.trailingAnchor constraintEqualToAnchor:self.imageImg.trailingAnchor constant:0].active = YES;
    [self.titleLbl.bottomAnchor constraintEqualToAnchor:self.imageImg.bottomAnchor constant:0].active = YES;
  
 //   [self.imageImg.heightAnchor constraintEqualToAnchor:self.contentView.heightAnchor constant:0.3].active = YES;
    
  //  [self.contentView addConstraint:top];
 //   [self.contentView addConstraint:trailing];
 //   [self.contentView addConstraint:leading];
  //  [self.contentView addConstraint:heighTitle];
}

//- (void)viewDidLayoutSubviews
// {
//    [self viewDidLayoutSubviews];
//
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureCellWith:(Feed *)feed {
    
    self.titleLbl.text = feed.title;
    if (feed.image_url) {
        // set image url if image url doesn't equal nil
        NSURL *imageURL = [NSURL URLWithString:feed.image_url];
        [self.imageImg setImageWithURL:imageURL];
    } else {
        // set noimage if image url is equal nil
        UIImage* noImage = [UIImage imageNamed:@"noimage"];
        [self.imageImg setImage:noImage];
    }
}

@end
