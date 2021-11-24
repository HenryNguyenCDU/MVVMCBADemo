//
//  FeedController.m
//  RSSReader

#import "FeedController.h"
#import "FeedController+Alerts.h"
#import <UIKit/UIKit.h>
// libraies
#import "FBKVOController.h"
#import <KVOController/NSObject+FBKVOController.h>
// project files
#import "DetailController.h"
#import "Feed.h"
#import "FeedViewModel.h"
#import "FeedCell.h"
#import "Helper.h"

// feed cell identifier
static NSString * const CELL_IDENTIFIER  = @"feed_cell";
// cell height
static const CGFloat CELL_HEIGHT = 180.f;
// storyboard name
static NSString * const STORYBORAD_NAME = @"Detail";
// controller id
static NSString * const CONTROLLER_ID = @"DetailControllerID";

@interface FeedController()

@property (strong, nonatomic) FBKVOController *kvoController;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIButton *cancelBtn;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@end


@implementation FeedController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUserInterface];
    // get helper instance
    self.helper = [Helper sharedInstance];
    // setting user interface
 
    // setting kvo controller
    self.kvoController = [FBKVOController controllerWithObserver:self];

    // initializing feed viewmodel
    self.feedViewModel = [FeedViewModel new];
    // initializing feeds array
    self.feedViewModel.feedsArray = [NSMutableArray new];
    // initializing internet connection flag
    self.feedViewModel.isDisconnected = [NSNumber numberWithBool:true];
    
    // setting observes
    [self setupObservers];
    
  //  NSLog(@"%@",self.feedViewModel.feedsArray);
    
}


# pragma mark - Setup User Interface
- (void)setupUserInterface {
    // getting offset for hiding search bar
    CGFloat originX = 0;
    CGFloat originY = 44;
    self.tableView.contentOffset = CGPointMake(originX, originY);
    // setting right button in navigation bar
    [self _setCustomRightBarButtonItem];
    // setting back button in navigation bar
 // [self _setCustomBackBarButtonItem];
    [self _setUITableView];
    [self _setCustomSearchBar];
    
}

// setting up observers
- (void)setupObservers {
    // setting up observer on channel title property
    [self.kvoController observe:self.feedViewModel
                        keyPath:@"channelTitle"
                        options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew
                         action:@selector(setTitle)];
    // setting up observer on feeds array property
    [self.kvoController observe:self.feedViewModel
                        keyPath:@"feedsArray"
                        options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew
                         action:@selector(reloadTableview)];
    // setting up observer on internet connection property
    [self.kvoController observe:self.feedViewModel
                        keyPath:@"isDisconnected"
                        options:NSKeyValueObservingOptionNew
                         action:@selector(fetchFromDBIfDisconnectedAlert)];
    // setting up observer on has received error
    [self.kvoController observe:self.feedViewModel
                        keyPath:@"hasReceivedError"
                        options:NSKeyValueObservingOptionNew
                         action:@selector(showRequestErrorAlert)];
}

- (void)_setCustomSearchBar {
    
 //   int _margin = 20;
 //   int _rightMargin = 20;
    int _height = 44;
    UIView *barWrapper = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, _height)];
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height -10)];
   // barWrapper.backgroundColor = [UIColor yellowColor];
    self.searchBar.delegate = self;
    self.searchBar.showsCancelButton = false;
   // self.searchBar.backgroundColor = [UIColor greenColor];
    [self.searchBar sizeToFit];
   
    [barWrapper addSubview:self.searchBar];
    self.tableView.tableHeaderView = self.searchBar;
}
 
- (void)cancel:(UISearchBar *)searchBar{
    searchBar = self.searchBar;
    [self searchBarCancelButtonClicked:searchBar];
}

- (void)_refresh{
    
    if ([self.searchBar.text length] > 0) {
        [self doSearch];
    } else {
        [self.feedViewModel fetchAllFeedSortedByAttribute];
    }
}

- (void)_hideRefresh{
    
    [self.refreshControl endRefreshing];
}

- (void)_setUITableView {

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0,0)];
    self.refreshControl = [[UIRefreshControl alloc] init];
    //  self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
  
    if (@available(iOS 10.0, *)) {
        self.tableView.refreshControl = self.refreshControl;
    } else {
        // Fallback on earlier versions
        [self.tableView addSubview:self.refreshControl];
        
    }
    [self.refreshControl addTarget:self action:@selector(_refresh) forControlEvents:UIControlEventValueChanged];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[FeedCell class] forCellReuseIdentifier:CELL_IDENTIFIER];
    [self.view addSubview:self.tableView];
  
   //[self reloadTableview];
    
    [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:0].active = YES;
    [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0].active = YES;
    [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0].active = YES;
}


// setting custom right button
- (void)_setCustomRightBarButtonItem {
    // get button image
    UIImage *browseButtonIcon = [UIImage imageNamed:@"settings_icon"];
    // set button with image
    UIBarButtonItem *browseBtn = [[UIBarButtonItem alloc]
                                  initWithImage:browseButtonIcon
                                  style:UIBarButtonItemStyleDone
                                  target:self
                                  action:@selector(changeRssChannelAlert)];
    self.navigationItem.rightBarButtonItem = browseBtn;
}

// setting custom back button
- (void)_setCustomBackBarButtonItem {
    UIBarButtonItem *backItem = [UIBarButtonItem new];
    backItem.title = @"";
    [self.navigationItem setBackBarButtonItem:backItem];
}



// tableview reloading
- (void)reloadTableview {
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
}

// setting title
- (void)setTitle {
    self.navigationItem.title = self.feedViewModel.channelTitle;
}

# pragma mark - UITableViewDataSource
// get number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feedViewModel.feedsArray.count;
}

// setting tableview cell by feed model
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FeedCell *cell = (FeedCell *)[tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
  //  if (cell == nil)
  //          cell = [[FeedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_IDENTIFIER];

    Feed *feed = self.feedViewModel.feedsArray[indexPath.row];

    [cell configureCellWith:feed];
  //  [cell layoutIfNeeded];

    return cell;
}
 


# pragma mark - UITableViewDelegate
// getting custom cell height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}

#pragma mark - UISearchBarDelegate
// perform if text in search bar did changed
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([self.searchBar.text length] > 0) {
        [self doSearch];
    } else {
        [self.feedViewModel fetchAllFeedSortedByAttribute];
    }
}

// perform if cancel button has clicked
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
    self.searchBar.text = @"";
    self.searchBar.showsCancelButton = false;
    [self.feedViewModel fetchAllFeedSortedByAttribute];
}

// perform if text begin editing
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    self.searchBar.showsCancelButton = true;
}

// perform if search button has clicked
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
    [self doSearch];
}

// search feeds by prefix of title
- (void)doSearch {
    NSString *searchText = self.searchBar.text;
   [self.feedViewModel searchFeedByTitlePrefix:searchText];
   
}

# pragma mark - Segue to DetailController
// segue to DetailController by cell taping
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // deselect row
    [self.tableView deselectRowAtIndexPath:indexPath animated:true];

    DetailController *detailVC  = [[DetailController alloc] init];
    
    detailVC.feed = self.feedViewModel.feedsArray[indexPath.row];
    UINavigationController *navigationVC = self.navigationController;
    [navigationVC pushViewController:detailVC animated:true];
}

# pragma mark - Deallocation
- (void)dealloc {
    // unobserve all observers
    [self.kvoController unobserveAll];
}

@end
